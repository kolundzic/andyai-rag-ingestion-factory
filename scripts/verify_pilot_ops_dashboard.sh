#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Pilot Ops Dashboard"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_client_follow_up.sh

for f in \
docs/77-pilot-ops-dashboard/PILOT_OPS_DASHBOARD.md \
docs/77-pilot-ops-dashboard/DASHBOARD_METRIC_STANDARD.md \
docs/77-pilot-ops-dashboard/OPS_STATUS_MODEL.md \
schemas/pilot-ops-dashboard.schema.json \
apps/knowledgefactory-web/lib/pilotOpsDashboard.ts \
apps/knowledgefactory-web/app/pilot-ops-dashboard/page.tsx \
apps/knowledgefactory-web/app/api/pilot-ops-dashboard/demo/route.ts \
src/rag_ingestion_factory/runtime/pilot_ops_dashboard.py \
tests/test_pilot_ops_dashboard.py; do
  test -f "$f"
done
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.runtime.pilot_ops_dashboard import build_ops_dashboard
assert build_ops_dashboard()["total_requests"] == 3
print("🟢 Pilot ops dashboard Python smoke test passed")
PY
echo "🟢 Pilot ops dashboard verified"
