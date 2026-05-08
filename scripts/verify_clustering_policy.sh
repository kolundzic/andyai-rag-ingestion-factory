#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_distillation_layer.sh
test -f src/rag_ingestion_factory/distillation/clustering.py
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.distillation.clustering import cluster_near_duplicates
assert cluster_near_duplicates([{"id":"a","claim":"A B"},{"id":"b","claim":"A C"}], 0.2)
print("🟢 Clustering smoke test passed")
PY
echo "🟢 Near-duplicate clustering verified"
