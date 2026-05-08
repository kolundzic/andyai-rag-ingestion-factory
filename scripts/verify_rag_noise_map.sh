#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_knowledgeblock_schema_examples.sh
test -f docs/82-rag-noise-map/RAG_NOISE_MAP.md
test -f schemas/rag-noise-event.schema.json
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.knowledgeblocks.noise import noise_map
assert "duplicate_chunks" in noise_map()
print("🟢 RAG noise map smoke test passed")
PY
echo "🟢 RAG noise map verified"
