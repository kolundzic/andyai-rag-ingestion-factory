#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Strategic Canon Visuals"
echo "━━━━━━━━━━━━━━━━━━━━"

test -f apps/knowledgefactory-web/lib/strategicVisuals.ts
test -f apps/knowledgefactory-web/app/visuals/strategic/page.tsx
test -f apps/knowledgefactory-web/app/api/canon-visuals/strategic/route.ts
test -f docs/98-strategic-visuals/STRATEGIC_VISUAL_MASTER_INDEX.md

asset_count=$(find assets/canon-visuals/strategic -maxdepth 1 -type f -name '*.png' | wc -l | tr -d ' ')
public_count=$(find apps/knowledgefactory-web/public/canon-visuals/strategic -maxdepth 1 -type f -name '*.png' | wc -l | tr -d ' ')

if [ "$asset_count" -ne 10 ]; then
  echo "🔴 Expected 10 strategic asset visuals, found $asset_count"
  exit 1
fi

if [ "$public_count" -ne 10 ]; then
  echo "🔴 Expected 10 public strategic visuals, found $public_count"
  exit 1
fi

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.strategic_visuals import strategic_visual_manifest
m = strategic_visual_manifest()
assert m["count"] == 10
print("🟢 Strategic visual manifest smoke test passed")
PY

echo "🟢 Strategic visuals verified"
