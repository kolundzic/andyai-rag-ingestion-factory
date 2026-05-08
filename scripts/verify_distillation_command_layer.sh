#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_knowledgeblock_benchmark.sh
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.distillation.command_layer import command_status
assert "extract_candidates" in command_status()["commands"]
print("🟢 Distillation command layer smoke test passed")
PY
echo "🟢 Distillation command layer verified"
