#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Pilot Intake Admin Review Layer"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_pilot_request_conversion.sh

for f in \
docs/68-pilot-intake-admin-review/PILOT_INTAKE_ADMIN_REVIEW_LAYER.md \
docs/68-pilot-intake-admin-review/PILOT_ADMIN_QUEUE_SPEC.md \
docs/68-pilot-intake-admin-review/PILOT_REVIEW_DECISION_MODEL.md \
docs/68-pilot-intake-admin-review/ADMIN_REVIEW_PLAYBOOK.md \
docs/68-pilot-intake-admin-review/ADMIN_REVIEW_COPY_BANK.md \
docs/68-pilot-intake-admin-review/PILOT_ADMIN_ROADMAP.md \
docs/releases/RELEASE_NOTES_v16.9.0.md \
schemas/pilot-admin-review.schema.json \
schemas/pilot-admin-queue.schema.json \
examples/pilot-intake-admin-review/sample-admin-queue.json \
examples/pilot-intake-admin-review/sample-admin-summary.json \
apps/knowledgefactory-web/lib/pilotAdminReview.ts \
apps/knowledgefactory-web/app/pilot-admin/page.tsx \
apps/knowledgefactory-web/app/api/pilot-request/admin-demo/route.ts; do
  test -f "$f"
done

grep -q "A pilot request is not complete" apps/knowledgefactory-web/lib/pilotAdminReview.ts
grep -q "summarizePilotQueue" apps/knowledgefactory-web/lib/pilotAdminReview.ts
grep -q "PilotAdminPage" apps/knowledgefactory-web/app/pilot-admin/page.tsx
grep -q "pilotAdminReview" apps/knowledgefactory-web/app/api/pilot-request/admin-demo/route.ts
grep -q "approved_for_pilot" schemas/pilot-admin-review.schema.json

echo "🟢 Pilot admin docs present"
echo "🟢 Pilot admin page present"
echo "🟢 Pilot admin API route present"
echo "🟢 Admin queue model present"
echo "🟢 Pilot intake admin review verified"
