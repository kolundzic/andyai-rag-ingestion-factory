#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Pilot Create/List API Route Scaffolding"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_supabase_client_runtime_wiring.sh

for f in \
docs/71-pilot-api-routes/PILOT_CREATE_LIST_API_SCAFFOLDING.md \
docs/71-pilot-api-routes/PILOT_API_ROUTE_CONTRACT.md \
docs/71-pilot-api-routes/PILOT_API_RESPONSE_STANDARD.md \
docs/71-pilot-api-routes/PILOT_API_ERROR_MODEL.md \
schemas/pilot-create-request.schema.json \
schemas/pilot-list-response.schema.json \
schemas/pilot-summary-response.schema.json \
apps/knowledgefactory-web/lib/pilotApiRoutes.ts \
apps/knowledgefactory-web/app/api/pilot-request/create/route.ts \
apps/knowledgefactory-web/app/api/pilot-request/list/route.ts \
apps/knowledgefactory-web/app/api/pilot-request/summary/route.ts \
src/rag_ingestion_factory/runtime/pilot_api_routes.py \
tests/test_pilot_api_routes.py; do
  test -f "$f"
done

grep -q "Runtime wiring connects the bridge" apps/knowledgefactory-web/lib/pilotApiRoutes.ts
grep -q "createPilotRequestDemo" apps/knowledgefactory-web/app/api/pilot-request/create/route.ts
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.runtime.pilot_api_routes import summarize_pilot_items
s = summarize_pilot_items([{"status": "approved_for_pilot", "priority": "high"}])
assert s["total"] == 1
assert s["high_priority"] == 1
print("🟢 Pilot API Python smoke test passed")
PY
if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest -q tests/test_pilot_api_routes.py
else
  echo "🟡 pytest not installed; skipped unit tests"
fi
echo "🟢 Pilot API routes verified"
