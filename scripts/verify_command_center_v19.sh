#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — v19 Command Center"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_pilot_ops_dashboard.sh

for f in \
docs/78-command-center/KNOWLEDGE_FACTORY_COMMAND_CENTER.md \
docs/78-command-center/PILOT_SYSTEM_FULL_FLOW.md \
docs/78-command-center/BUSINESS_INTAKE_ARCHITECTURE.md \
docs/78-command-center/PRODUCTION_READINESS_RECAP_v19.md \
docs/78-command-center/V19_CANON_LOCK.md \
docs/78-command-center/V19_RELEASE_NOTES.md \
schemas/command-center-status.schema.json \
schemas/production-readiness-score.schema.json \
apps/knowledgefactory-web/lib/commandCenter.ts \
apps/knowledgefactory-web/app/command-center/page.tsx \
apps/knowledgefactory-web/app/api/command-center/status/route.ts \
src/rag_ingestion_factory/runtime/command_center.py \
tests/test_command_center.py; do
  test -f "$f"
done
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.runtime.command_center import command_center_status
s=command_center_status()
assert s["version"] == "v19.0.0"
assert s["score"] >= 80
print("🟢 Command center Python smoke test passed")
PY
if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest -q tests/test_command_center.py
else
  echo "🟡 pytest not installed; skipped unit tests"
fi
echo "🟢 v19 command center verified"
