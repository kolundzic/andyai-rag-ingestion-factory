#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_knowledgeblock_export.sh
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.indexes.vector_surface import can_index
assert can_index({"status":"approved"})
print("🟢 Clean vector surface smoke test passed")
PY
echo "🟢 Vector clean surface verified"
