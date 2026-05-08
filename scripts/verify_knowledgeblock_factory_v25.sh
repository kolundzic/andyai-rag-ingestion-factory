#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Sovereign KnowledgeBlock Factory v25"
echo "━━━━━━━━━━━━━━━━━━━━"
./scripts/verify_knowledgeblock_production_pipeline.sh
for f in docs/97-sovereign-knowledgeblock-factory/SOVEREIGN_KNOWLEDGEBLOCK_FACTORY.md docs/97-sovereign-knowledgeblock-factory/V20_TO_V25_MASTER_RECAP.md docs/97-sovereign-knowledgeblock-factory/KNOWLEDGEBLOCK_ARCHITECTURE_LOCK.md docs/97-sovereign-knowledgeblock-factory/RAG_TO_KNOWLEDGEBLOCK_TO_TRUSTED_KNOWLEDGE.md docs/97-sovereign-knowledgeblock-factory/PUBLIC_POSITIONING_v25.md docs/97-sovereign-knowledgeblock-factory/V25_CANON_LOCK.md apps/knowledgefactory-web/app/knowledgeblock-factory/page.tsx apps/knowledgefactory-web/app/api/knowledgeblock-factory/status/route.ts src/rag_ingestion_factory/knowledgeblock_factory.py tests/test_knowledgeblock_factory_v25.py; do
  test -f "$f"
done
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.knowledgeblock_factory import knowledgeblock_factory_status
s=knowledgeblock_factory_status()
assert s["version"] == "v25.0.0"
assert s["score"] >= 80
print("🟢 Sovereign KnowledgeBlock Factory smoke test passed")
PY
if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest -q tests/test_knowledgeblock_factory_v25.py
else
  echo "🟡 pytest not installed; skipped unit tests"
fi
echo "🟢 Sovereign KnowledgeBlock Factory verified"
