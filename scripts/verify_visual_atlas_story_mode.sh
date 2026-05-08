#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Visual Atlas Interactive Story Mode"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_visual_atlas_demo_layer.sh

for f in \
docs/65-visual-atlas-interactive-story/VISUAL_ATLAS_INTERACTIVE_STORY_MODE.md \
docs/65-visual-atlas-interactive-story/STORY_MODE_FLOW_SPEC.md \
docs/65-visual-atlas-interactive-story/STORY_MODE_UI_SPEC.md \
docs/65-visual-atlas-interactive-story/STORY_MODE_OPERATOR_SCRIPT.md \
docs/65-visual-atlas-interactive-story/STORY_MODE_COPY_BANK.md \
docs/releases/RELEASE_NOTES_v16.6.0.md \
schemas/visual-atlas-story-mode.schema.json \
schemas/visual-atlas-story-navigation.schema.json \
examples/visual-atlas-interactive-story/story-mode-manifest.json \
examples/visual-atlas-interactive-story/story-mode-step-payload.json \
apps/knowledgefactory-web/lib/visualAtlasStoryMode.ts \
apps/knowledgefactory-web/app/visuals/story/page.tsx \
apps/knowledgefactory-web/app/api/canon-visuals/story-mode/route.ts; do
  test -f "$f"
done

STEP_COUNT="$(grep -c 'order:' apps/knowledgefactory-web/lib/visualAtlasStoryMode.ts | tr -d ' ')"
if [ "$STEP_COUNT" -lt "10" ]; then
  echo "🔴 Expected at least 10 story steps, got $STEP_COUNT"
  exit 1
fi

grep -q "origin-problem" apps/knowledgefactory-web/lib/visualAtlasStoryMode.ts
grep -q "product-surface" apps/knowledgefactory-web/lib/visualAtlasStoryMode.ts
grep -q "A serious product should not only show its architecture" docs/releases/RELEASE_NOTES_v16.6.0.md

echo "🟢 10 story steps present"
echo "🟢 Story page present"
echo "🟢 Story API route present"
echo "🟢 Story mode verified"
