#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_llm_wiki_bridge.sh
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — WikiPress Product Bridge"
echo "━━━━━━━━━━━━━━━━━━━━"
test -f docs/100-wikipress-product-bridge/WIKIPRESS_PRODUCT_BRIDGE.md
test -f docs/100-wikipress-product-bridge/V26_CANON_LOCK.md
test -f apps/knowledgefactory-web/app/wikipress-bridge/page.tsx
test -f apps/knowledgefactory-web/app/api/wikipress-bridge/status/route.ts
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.wiki_bridge.wikipress_bridge import wikipress_bridge_status
assert wikipress_bridge_status()["version"] == "v26.0.0"
print("🟢 WikiPress bridge smoke test passed")
PY
echo "🟢 WikiPress Product Bridge verified"
