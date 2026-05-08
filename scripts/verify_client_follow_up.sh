#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Client Follow-Up Draft Layer"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_pilot_proposal_generator.sh

for f in \
docs/76-client-follow-up/CLIENT_FOLLOW_UP_DRAFT_LAYER.md \
docs/76-client-follow-up/FOLLOW_UP_TEMPLATES.md \
docs/76-client-follow-up/FOLLOW_UP_DECISION_MAPPING.md \
docs/76-client-follow-up/EMAIL_TONE_STANDARD.md \
schemas/pilot-follow-up-draft.schema.json \
apps/knowledgefactory-web/lib/pilotFollowUpDrafts.ts \
apps/knowledgefactory-web/app/pilot-admin/follow-up/page.tsx \
apps/knowledgefactory-web/app/api/pilot-request/follow-up-demo/route.ts \
src/rag_ingestion_factory/runtime/pilot_follow_up.py \
tests/test_pilot_follow_up.py; do
  test -f "$f"
done
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.runtime.pilot_follow_up import draft_for_status
assert "pilot review" in draft_for_status("approved_for_pilot")["subject"]
print("🟢 Follow-up Python smoke test passed")
PY
echo "🟢 Client follow-up layer verified"
