#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_rag_noise_map.sh
for f in docs/83-knowledge-distillation-layer/KNOWLEDGE_DISTILLATION_LAYER.md schemas/candidate-knowledgeblock.schema.json src/rag_ingestion_factory/distillation/pipeline.py tests/test_distillation_pipeline.py; do
  test -f "$f"
done
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.distillation.pipeline import distill_candidate
assert distill_candidate("c1", "claim")["decision"] == "needs_review"
print("🟢 Distillation layer smoke test passed")
PY
echo "🟢 Distillation layer verified"
