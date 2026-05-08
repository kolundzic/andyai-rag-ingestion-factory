#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v16.4.0 — Canon Visual Master Atlas"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_visual_atlas_allowlist.sh

for f in \
docs/63-canon-visual-atlas/CANON_VISUAL_MASTER_INDEX.md \
docs/63-canon-visual-atlas/CANON_VISUAL_ALLOWLIST.md \
docs/63-canon-visual-atlas/DIAGRAM_PURPOSE_MAP.md \
docs/63-canon-visual-atlas/VISUAL_ATLAS_WEB_SPEC.md \
docs/releases/RELEASE_NOTES_v16.4.0.md \
schemas/canon-visual.schema.json \
examples/canon-visual-atlas/visual-atlas-manifest.json \
apps/knowledgefactory-web/lib/visualAtlas.ts \
apps/knowledgefactory-web/app/visuals/atlas/page.tsx \
apps/knowledgefactory-web/app/api/canon-visuals/atlas/route.ts \
scripts/verify_visual_atlas_allowlist.sh \
scripts/print_v16_4_visual_atlas.sh; do
  test -f "$f"
done

echo "🟢 Master visual atlas docs present"
echo "🟢 Web atlas page present"
echo "🟢 Atlas API route present"
echo "🟢 VERIFY PASSED"
