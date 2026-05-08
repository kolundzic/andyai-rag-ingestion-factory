#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Admin Review Actions Persistence"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_pilot_api_routes.sh

for f in \
docs/72-admin-review-actions/ADMIN_REVIEW_ACTIONS_PERSISTENCE.md \
docs/72-admin-review-actions/REVIEW_STATUS_TRANSITION_MODEL.md \
docs/72-admin-review-actions/REVIEW_ACTION_VALIDATION_RULES.md \
schemas/pilot-review-action.schema.json \
schemas/pilot-review-action-response.schema.json \
apps/knowledgefactory-web/lib/pilotReviewActions.ts \
apps/knowledgefactory-web/app/api/pilot-request/review/route.ts \
src/rag_ingestion_factory/runtime/pilot_review_actions.py \
tests/test_pilot_review_actions.py; do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.runtime.pilot_review_actions import validate_review_action
ok, reason = validate_review_action({"request_id":"1","next_status":"reviewing","review_owner":"op","review_notes":"note","next_action":"call"})
assert ok and reason == "ok"
print("🟢 Review actions Python smoke test passed")
PY

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest -q tests/test_pilot_review_actions.py
else
  echo "🟡 pytest not installed; skipped unit tests"
fi
echo "🟢 Admin review actions verified"
