#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 MASTER-UDARAC DRY RUN CHECK"
echo "━━━━━━━━━━━━━━━━━━━━"
test -d .git
git status --short
git remote -v | head -2
git tag --list | tail -5
echo "🟢 Dry run check completed"
