#!/usr/bin/env bash
set -euo pipefail
PREVIOUS="${1:-previous}"
CURRENT="${2:-current}"
echo "━━━━━━━━━━━━━━━━━━━━"
echo "Release comparison"
echo "Previous: ${PREVIOUS}"
echo "Current: ${CURRENT}"
echo "━━━━━━━━━━━━━━━━━━━━"
git diff --stat "${PREVIOUS}" "${CURRENT}" || true
