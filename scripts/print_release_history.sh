#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "Release history"
echo "━━━━━━━━━━━━━━━━━━━━"
git tag --list "v*" | sort -V | tail -20
