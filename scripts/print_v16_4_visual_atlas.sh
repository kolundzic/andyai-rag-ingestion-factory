#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🖼️ AndyAI Knowledge Factory — Canon Visual Master Atlas"
echo "━━━━━━━━━━━━━━━━━━━━"
echo "Base visuals:"
find assets/canon-visuals -maxdepth 1 -type f -name '*.png' -print | sort
echo
echo "Extended visuals:"
find assets/canon-visuals/extended -maxdepth 1 -type f -name '*.png' -print | sort
