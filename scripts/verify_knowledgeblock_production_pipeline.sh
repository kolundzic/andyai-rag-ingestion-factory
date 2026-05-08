#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_knowledge_quality.sh
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.pipelines.knowledgeblock_pipeline import run_knowledgeblock_pipeline
assert run_knowledgeblock_pipeline()["stages"]
print("🟢 KnowledgeBlock production pipeline smoke test passed")
PY
echo "🟢 KnowledgeBlock production pipeline verified"
