#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — README & Documentation Polish"
echo "━━━━━━━━━━━━━━━━━━━━"

for f in \
  README.md \
  docs/00_START_HERE.md \
  docs/visuals/README_VISUAL_GALLERY.md \
  docs/architecture/MERMAID_ARCHITECTURE_SUITE.md \
  docs/public-beta-v1/README_PUBLIC_BETA_V1_OVERVIEW.md \
  docs/public-beta-v1/DOCUMENTATION_NAVIGATION_MAP.md \
  docs/public-beta-v1/V101_DOCUMENTATION_POLISH_KERNEL.md
do
  test -f "$f"
done

grep -q "AndyAI Knowledge Factory" README.md
grep -q "Public Beta v1 Candidate" README.md
grep -q "Visual Atlas" README.md
grep -q "mermaid" docs/architecture/MERMAID_ARCHITECTURE_SUITE.md
grep -q "v101.0.0" docs/public-beta-v1/V101_DOCUMENTATION_POLISH_KERNEL.md

VISUAL_COUNT="$(find assets/canon-visuals assets/canon-visuals/extended -maxdepth 1 -type f -name "*.png" 2>/dev/null | wc -l | tr -d ' ')"
echo "🟢 Visual assets detected: ${VISUAL_COUNT}"

echo "🟢 VERIFY PASSED"
