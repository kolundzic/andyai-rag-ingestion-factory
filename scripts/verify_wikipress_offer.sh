#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — WikiPress Offer"
echo "━━━━━━━━━━━━━━━━━━━━"
test -f docs/101-wikipress-offer-site/WIKIPRESS_OFFER_AND_LANDING_STRUCTURE.md
test -f apps/knowledgefactory-web/app/wikipress-offer/page.tsx
test -f apps/knowledgefactory-web/app/api/wikipress-offer/status/route.ts
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.wikipress import wikipress_offer_status
assert wikipress_offer_status()["version"] == "v26.1.0"
print("🟢 WikiPress offer smoke test passed")
PY
echo "🟢 WikiPress offer verified"
