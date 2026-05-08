#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v16.0.0 — Production Deploy Control Tower"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.control_tower.status import build_v16_control_tower_status
from rag_ingestion_factory.control_tower.readiness import build_default_v16_checks, calculate_deploy_readiness
from rag_ingestion_factory.control_tower.proof_bundle import build_v16_production_proof_bundle

status = build_v16_control_tower_status()
checks = build_default_v16_checks()
readiness = calculate_deploy_readiness(checks)
bundle = build_v16_production_proof_bundle()

assert status["site"] == "knowledgefactory.andyai.ai"
assert status["readiness"]["blocking_failures"] == 0
assert readiness["level"] in {"deploy-candidate", "production-ready"}
assert bundle.rollback_path == "git checkout v15.0.0"
assert len(bundle.gate_results) >= 5

print("🟢 v16 control tower status verified")
print("🟢 deploy readiness scoring verified")
print("🟢 production proof bundle verified")
PY

test -f docs/58-production-control-tower/V16_PRODUCTION_DEPLOY_CONTROL_TOWER.md
test -f docs/58-production-control-tower/VERCEL_DEPLOY_READINESS.md
test -f docs/58-production-control-tower/SUPABASE_DEPLOY_READINESS.md
test -f docs/58-production-control-tower/QDRANT_DEPLOY_READINESS.md
test -f docs/58-production-control-tower/ENVIRONMENT_VARIABLES_CHECKLIST.md
test -f docs/58-production-control-tower/DOMAIN_DNS_CHECKLIST.md
test -f docs/58-production-control-tower/PRODUCTION_GATES.md
test -f docs/58-production-control-tower/ROLLBACK_PLAN.md
test -f docs/58-production-control-tower/PRODUCTION_PROOF_BUNDLE.md
test -f docs/58-production-control-tower/RELEASE_RUNWAY_v16_TO_v20.md
test -f docs/releases/RELEASE_NOTES_v16.0.0.md
test -f schemas/deploy-readiness-check.schema.json
test -f schemas/production-proof-bundle.schema.json
test -f schemas/deploy-gate.schema.json
test -f examples/production-control-tower/sample-readiness-report.json
test -f examples/production-control-tower/sample-proof-bundle.json
test -f src/rag_ingestion_factory/control_tower/models.py
test -f src/rag_ingestion_factory/control_tower/readiness.py
test -f src/rag_ingestion_factory/control_tower/proof_bundle.py
test -f src/rag_ingestion_factory/control_tower/status.py
test -f apps/knowledgefactory-web/app/control-tower/page.tsx
test -f apps/knowledgefactory-web/app/deploy-readiness/page.tsx
test -f apps/knowledgefactory-web/app/api/control-tower/status/route.ts
test -f apps/knowledgefactory-web/app/api/deploy-readiness/demo/route.ts
test -f .github/workflows/production-control-tower.yml
test -f scripts/print_v16_control_tower_status.sh
test -f scripts/generate_v16_production_proof_bundle.sh

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
