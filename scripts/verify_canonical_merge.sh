#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_clustering_policy.sh
test -f src/rag_ingestion_factory/distillation/merge.py
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.distillation.merge import canonical_merge
assert canonical_merge([{"id":"a","confidence":0.1},{"id":"b","confidence":0.9}])["canonical"]["id"] == "b"
print("🟢 Canonical merge smoke test passed")
PY
echo "🟢 Canonical merge verified"
