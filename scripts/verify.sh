#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v10.1.0 — Canon Recap & Public Product Bridge"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.product.status import build_product_status

status = build_product_status()
assert status["product_name"] == "AndyAI Knowledge Factory"
assert status["product_site"] == "knowledgefactory.andyai.ai"
assert "200 PDFs" in status["origin"] or "100-200 PDFs" in status["origin"]
print("🟢 Product status verified")
print(f"🟢 Site: {status['product_site']}")
PY

test -f docs/43-recap/01_ORIGIN_STORY_FROM_200_PDFS.md
test -f docs/44-vercel-product/00_PRODUCT_DOMAIN_LOCK.md
test -f docs/45-supabase-runtime/00_SUPABASE_RUNTIME_STANDARD.md
test -f docs/46-subscriptions/00_SUBSCRIPTION_MODEL.md
test -f docs/47-public-launch/00_PUBLIC_LAUNCH_CANON.md
test -f docs/48-v10-to-v20-roadmap/00_ROADMAP_INDEX.md
test -f schemas/subscription_plan.schema.json
test -f schemas/workspace.schema.json
test -f schemas/public_demo_session.schema.json
test -f scripts/print_v10_1_recap.sh
test -f scripts/generate_public_positioning_preview.sh

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
