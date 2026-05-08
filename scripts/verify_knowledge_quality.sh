#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_distillation_command_layer.sh
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.quality.knowledge_quality import quality_score
assert quality_score({"evidence_refs":[{}], "status":"approved", "governance_tags":["internal"]}) == 100
print("🟢 Knowledge quality smoke test passed")
PY
echo "🟢 Knowledge quality verified"
