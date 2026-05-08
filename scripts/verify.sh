#!/usr/bin/env bash
set -euo pipefail

export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v4.1.0 — Sovereign Permission & Context Board"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.adapters.router import parse_document
from rag_ingestion_factory.core.chunker import chunk_page_blocks
from rag_ingestion_factory.embeddings.local import LocalDeterministicEmbeddingProvider
from rag_ingestion_factory.indexes.memory_vector_index import MemoryVectorIndex
from rag_ingestion_factory.retrieval.hybrid import HybridRetriever
from rag_ingestion_factory.retrieval.permission_aware import filter_candidates_by_permission
from rag_ingestion_factory.evidence.pack import build_evidence_pack
from rag_ingestion_factory.context_board.board import context_board_from_evidence_pack
from rag_ingestion_factory.drafting.from_evidence import draft_markdown_from_evidence
from rag_ingestion_factory.security.access_policy import AccessPolicy, PermissionContext

doc = register_document("examples/sample_documents/demo_document.txt")
pages = parse_document(doc)
chunks = chunk_page_blocks(pages)

embedder = LocalDeterministicEmbeddingProvider()
idx = MemoryVectorIndex()
for chunk in chunks:
    idx.upsert_chunk(chunk, embedder.embed(chunk.text))

query = "What does the ingestion pipeline prepare?"
results = HybridRetriever(chunks, idx).search(query, limit=5)
assert results

policies = {
    r.chunk_id: AccessPolicy(
        tenant_id="default",
        classification="internal",
        allowed_roles=("reader",),
    )
    for r in results
}
context = PermissionContext(
    user_id="demo-user",
    tenant_id="default",
    roles=("reader",),
    clearance_level="internal",
)
allowed = filter_candidates_by_permission(results, policies, context)
assert allowed

pack = build_evidence_pack(query, allowed, limit=3)
assert pack["citations"]

board = context_board_from_evidence_pack(pack)
assert board.evidence_items

draft = draft_markdown_from_evidence(pack)
assert "## Citations" in draft

print("🟢 Permission-aware retrieval passed")
print(f"🟢 Context Board: {board.board_id}")
print("🟢 Evidence-to-Draft passed")
PY

test -f docs/23-sovereign/SOVEREIGN_ENTERPRISE_STANDARD_v4_1.md
test -f docs/24-security/PERMISSION_AWARE_RETRIEVAL_v4_1.md
test -f docs/25-context-board/CONTEXT_BOARD_STANDARD_v4_1.md
test -f docs/26-drafting/EVIDENCE_TO_DRAFT_STANDARD_v4_1.md
test -f docs/27-agents/ENTERPRISE_AGENT_LAYER_v4_1.md
test -f schemas/access_policy.schema.json
test -f schemas/context_board.schema.json
test -f src/rag_ingestion_factory/security/access_policy.py
test -f src/rag_ingestion_factory/retrieval/permission_aware.py
test -f src/rag_ingestion_factory/context_board/board.py
test -f src/rag_ingestion_factory/drafting/from_evidence.py

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🟢 VERIFY PASSED"
echo "━━━━━━━━━━━━━━━━━━━━"
