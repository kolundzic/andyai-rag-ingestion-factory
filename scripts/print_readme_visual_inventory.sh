#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "README Visual Inventory"
echo "━━━━━━━━━━━━━━━━━━━━"
find assets/canon-visuals assets/canon-visuals/extended -maxdepth 1 -type f -name "*.png" 2>/dev/null | sort || true
