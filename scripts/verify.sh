#!/usr/bin/env bash
set -euo pipefail

export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 AndyAI RAG Ingestion Factory VERIFY"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from pathlib import Path
from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file

out = Path("examples/output/verify_run")
manifest = ingest_local_file("examples/sample_documents/demo_document.txt", out)

assert manifest["status"] == "completed"
assert manifest["chunks_count"] >= 1
assert manifest["pipeline_version"] == "1.3.0"
assert (out / "chunks.jsonl").exists()
assert (out / "manifest.json").exists()
assert (out / "keyword_index.json").exists()

print("🟢 Local ingestion smoke test passed")
print(f"🟢 Chunks created: {manifest['chunks_count']}")
PY

python3 - <<'PY'
from pathlib import Path
from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.adapters.router import parse_document
from rag_ingestion_factory.core.chunker import chunk_page_blocks
from rag_ingestion_factory.core.citations import citation_from_chunk
from rag_ingestion_factory.db.memory_repository import InMemoryMetadataRepository

source = Path("examples/sample_documents/demo_document.txt")
document = register_document(source)
pages = parse_document(document)
chunks = chunk_page_blocks(pages)
citations = [citation_from_chunk(chunk) for chunk in chunks]

repo = InMemoryMetadataRepository()
repo.save_document(document)
repo.save_chunks(chunks)
repo.save_citation_events(citations)

summary = repo.summary()
assert summary["documents"] == 1
assert summary["chunks"] >= 1
assert summary["citation_events"] >= 1

print("🟢 Metadata repository smoke test passed")
print(f"🟢 Metadata summary: {summary}")
PY

test -f db/migrations/001_metadata_schema.sql
test -f docs/11-database/POSTGRES_METADATA_LAYER_v1_3.md
test -f src/rag_ingestion_factory/db/metadata_models.py
test -f src/rag_ingestion_factory/db/memory_repository.py

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🟢 VERIFY PASSED"
echo "━━━━━━━━━━━━━━━━━━━━"
