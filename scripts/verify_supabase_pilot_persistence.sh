#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Supabase Pilot Request Persistence Rescue"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_pilot_intake_admin_review.sh

for f in \
db/supabase/migrations/017_pilot_request_persistence.sql \
db/supabase/seeds/017_pilot_request_seed.sql \
docs/69-supabase-pilot-persistence/SUPABASE_PILOT_REQUEST_PERSISTENCE.md \
docs/69-supabase-pilot-persistence/SUPABASE_SCHEMA_STANDARD.md \
docs/69-supabase-pilot-persistence/RLS_POLICY_NOTES.md \
docs/69-supabase-pilot-persistence/PILOT_REQUEST_RUNTIME_ADAPTER.md \
docs/69-supabase-pilot-persistence/PERSISTENCE_DEPLOYMENT_CHECKLIST.md \
docs/69-supabase-pilot-persistence/PILOT_PERSISTENCE_ROADMAP.md \
docs/releases/RELEASE_NOTES_v17.0.1.md \
schemas/pilot-request-persistence.schema.json \
schemas/supabase-pilot-request-table.schema.json \
examples/supabase-pilot-persistence/sample-persisted-pilot-request.json \
examples/supabase-pilot-persistence/sample-persistence-readiness.json \
apps/knowledgefactory-web/lib/pilotRequestPersistence.ts \
apps/knowledgefactory-web/app/pilot-admin/persistence/page.tsx \
apps/knowledgefactory-web/app/api/pilot-request/persistence-demo/route.ts \
src/rag_ingestion_factory/runtime/pilot_request_persistence.py \
tests/test_pilot_request_persistence.py; do
  test -f "$f"
done

grep -q "create table if not exists public.pilot_requests" db/supabase/migrations/017_pilot_request_persistence.sql
grep -q "enable row level security" db/supabase/migrations/017_pilot_request_persistence.sql
grep -q "pilot_requests_demo_select" db/supabase/migrations/017_pilot_request_persistence.sql
grep -q "A pilot request becomes operational" apps/knowledgefactory-web/lib/pilotRequestPersistence.ts
grep -q "PilotPersistencePage" apps/knowledgefactory-web/app/pilot-admin/persistence/page.tsx
grep -q "demo_pilot_request_record" src/rag_ingestion_factory/runtime/pilot_request_persistence.py

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.runtime.pilot_request_persistence import demo_pilot_request_record, summarize_records
record = demo_pilot_request_record()
summary = summarize_records([record])
assert record.review_status == "approved_for_pilot"
assert summary["total"] == 1
assert summary["high_priority"] == 1
print("🟢 Python persistence adapter smoke test passed")
PY

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest -q tests/test_pilot_request_persistence.py
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 Supabase migration present"
echo "🟢 Supabase seed present"
echo "🟢 Persistence page present"
echo "🟢 Persistence API route present"
echo "🟢 Runtime adapter present"
echo "🟢 Supabase pilot persistence rescue verified"
