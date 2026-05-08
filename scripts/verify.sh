#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v1.5.0"
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

doc = register_document("examples/sample_documents/demo_document.txt")
pages = parse_document(doc)
chunks = chunk_page_blocks(pages)
idx = MemoryVectorIndex()
for c in chunks:
    idx.upsert_chunk(c, embed_text(c.text))
results = HybridRetriever(chunks, idx).search("What does the ingestion pipeline prepare?", limit=3)
assert results
print("🟢 v1.5 hybrid retrieval smoke test passed")
PY

test -f docs/14-retrieval/HYBRID_RETRIEVAL_ENGINE_v1_5.md
test -f src/rag_ingestion_factory/retrieval/hybrid.py
test -f src/rag_ingestion_factory/retrieval/keyword.py

echo "🟢 VERIFY PASSED"
