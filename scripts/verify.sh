#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v2.0.0"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from pathlib import Path
from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file
from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.adapters.router import parse_document
from rag_ingestion_factory.core.chunker import chunk_page_blocks
from rag_ingestion_factory.indexes.deterministic_embeddings import embed_text
from rag_ingestion_factory.indexes.memory_vector_index import MemoryVectorIndex
from rag_ingestion_factory.retrieval.hybrid import HybridRetriever
from rag_ingestion_factory.evidence.pack import build_evidence_pack
from rag_ingestion_factory.governance.audit import GovernanceAuditLog

out = Path("examples/output/verify_run")
manifest = ingest_local_file("examples/sample_documents/demo_document.txt", out)
assert manifest["status"] == "completed"

doc = register_document("examples/sample_documents/demo_document.txt")
pages = parse_document(doc)
chunks = chunk_page_blocks(pages)
idx = MemoryVectorIndex()
for c in chunks:
    idx.upsert_chunk(c, embed_text(c.text))

results = HybridRetriever(chunks, idx).search("What does the ingestion pipeline prepare?", limit=3)
pack = build_evidence_pack("What does the ingestion pipeline prepare?", results)
assert pack["citations"]

audit = GovernanceAuditLog()
audit.record("verify", "passed", {"results": len(results), "citations": len(pack["citations"])})
assert audit.summary()["events"] == 1
assert audit.summary()["failures"] == 0

print("🟢 v2.0 full governance smoke test passed")
PY

test -f docs/16-governance/PRODUCTION_GOVERNANCE_v2_0.md
test -f docs/16-governance/PRODUCTION_READINESS_CHECKLIST.md
test -f docs/releases/RELEASE_NOTES_v2.0.0.md
test -f src/rag_ingestion_factory/governance/audit.py
test -f scripts/apply_github_metadata.sh

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
