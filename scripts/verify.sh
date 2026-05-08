#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v1.4.0"
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

out = Path("examples/output/verify_run")
manifest = ingest_local_file("examples/sample_documents/demo_document.txt", out)
assert manifest["status"] == "completed"
assert manifest["chunks_count"] >= 1

doc = register_document("examples/sample_documents/demo_document.txt")
pages = parse_document(doc)
chunks = chunk_page_blocks(pages)
idx = MemoryVectorIndex()
for c in chunks:
    idx.upsert_chunk(c, embed_text(c.text))
results = idx.search("ingestion pipeline", limit=3)
assert results

print("🟢 v1.4 vector adapter smoke test passed")
PY

test -f docs/13-vector/QDRANT_VECTOR_ADAPTER_v1_4.md
test -f src/rag_ingestion_factory/indexes/memory_vector_index.py
test -f src/rag_ingestion_factory/indexes/qdrant_adapter.py

echo "🟢 VERIFY PASSED"
