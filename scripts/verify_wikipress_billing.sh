#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_wikipress_publishing.sh
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — WikiPress Billing Readiness"
echo "━━━━━━━━━━━━━━━━━━━━"
test -f docs/104-launch-kernel/WIKIPRESS_BILLING_AND_SUBSCRIPTION_READINESS.md
test -f schemas/wikipress-plan.schema.json
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.wikipress.billing import plan_allows
assert plan_allows("Pro", "projects", 3)
print("🟢 WikiPress billing smoke test passed")
PY
echo "🟢 WikiPress billing readiness verified"
