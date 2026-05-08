#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Visual Atlas Product Demo Layer"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_visual_atlas_allowlist.sh

for f in \
docs/64-visual-atlas-product-demo/VISUAL_ATLAS_PRODUCT_DEMO_LAYER.md \
docs/64-visual-atlas-product-demo/DIAGRAM_TEXTUAL_LEGENDS.md \
docs/64-visual-atlas-product-demo/VISUAL_ATLAS_STORY_FLOW.md \
docs/64-visual-atlas-product-demo/ATLAS_DEMO_COPY_BANK.md \
docs/64-visual-atlas-product-demo/SLIDE_LEGEND_STANDARD.md \
docs/releases/RELEASE_NOTES_v16.5.0.md \
schemas/visual-atlas-legend.schema.json \
schemas/visual-atlas-story-step.schema.json \
examples/visual-atlas-product-demo/visual-atlas-legends.json \
examples/visual-atlas-product-demo/visual-atlas-story-flow.json \
examples/visual-atlas-product-demo/demo-page-payload.json \
apps/knowledgefactory-web/lib/visualAtlasLegends.ts \
apps/knowledgefactory-web/app/visuals/demo/page.tsx \
apps/knowledgefactory-web/app/api/canon-visuals/demo-layer/route.ts; do
  test -f "$f"
done

LEGEND_COUNT="$(grep -c 'id:' apps/knowledgefactory-web/lib/visualAtlasLegends.ts | tr -d ' ')"
if [ "$LEGEND_COUNT" -lt "14" ]; then
  echo "🔴 Expected at least 14 legend entries, got $LEGEND_COUNT"
  exit 1
fi

grep -q "The visual atlas is not a gallery" apps/knowledgefactory-web/lib/visualAtlasLegends.ts
grep -q "Vizuelni atlas nije galerija" docs/releases/RELEASE_NOTES_v16.5.0.md
grep -q "Slike se ne kupe metlom" apps/knowledgefactory-web/lib/visualAtlasLegends.ts

echo "🟢 14 textual legends present"
echo "🟢 Demo page present"
echo "🟢 Demo API route present"
echo "🟢 Product demo layer verified"
