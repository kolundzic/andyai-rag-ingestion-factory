#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v1.6.0"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from pathlib import Path
from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.adapters.router import parse_document
from rag_ingestion_factory.core.chunker import chunk_page_blocks
from rag_ingestion_factory.indexes.deterministic_embeddings import embed_text
from rag_ingestion_factory.indexes.memory_vector_index import MemoryVectorIndex
from rag_ingestion_factory.retrieval.hybrid import HybridRetriever
from rag_ingestion_factory.evidence.pack import build_evidence_pack

doc = register_document("examples/sample_documents/demo_document.txt")
pages = parse_document(doc)
chunks = chunk_page_blocks(pages)
idx = MemoryVectorIndex()
for c in chunks:
    idx.upsert_chunk(c, embed_text(c.text))
results = HybridRetriever(chunks, idx).search("What does the ingestion pipeline prepare?", limit=3)
pack = build_evidence_pack("What does the ingestion pipeline prepare?", results)
assert pack["citations"]
assert pack["answer_context"]
print("🟢 v1.6 evidence pack smoke test passed")
PY

test -f docs/15-evidence/EVIDENCE_RERANKER_v1_6.md
test -f src/rag_ingestion_factory/evidence/pack.py

echo "🟢 VERIFY PASSED"
