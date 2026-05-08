#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Pilot Review Audit Trail"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_admin_review_actions.sh

for f in \
db/supabase/migrations/018_pilot_request_audit_events.sql \
db/supabase/seeds/018_pilot_request_audit_seed.sql \
docs/73-pilot-audit-trail/PILOT_REVIEW_AUDIT_TRAIL.md \
docs/73-pilot-audit-trail/AUDIT_EVENT_SCHEMA_STANDARD.md \
docs/73-pilot-audit-trail/REVIEW_TRACEABILITY_POLICY.md \
schemas/pilot-audit-event.schema.json \
apps/knowledgefactory-web/lib/pilotAuditTrail.ts \
apps/knowledgefactory-web/app/pilot-admin/audit/page.tsx \
apps/knowledgefactory-web/app/api/pilot-request/audit-demo/route.ts \
src/rag_ingestion_factory/runtime/pilot_audit_trail.py \
tests/test_pilot_audit_trail.py; do
  test -f "$f"
done

grep -q "pilot_request_audit_events" db/supabase/migrations/018_pilot_request_audit_events.sql
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.runtime.pilot_audit_trail import create_audit_event, summarize_audit_events
e=create_audit_event("p","op","new","reviewing","reason")
assert summarize_audit_events([e])["status_changes"] == 1
print("🟢 Audit trail Python smoke test passed")
PY
if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest -q tests/test_pilot_audit_trail.py
else
  echo "🟡 pytest not installed; skipped unit tests"
fi
echo "🟢 Pilot audit trail verified"
