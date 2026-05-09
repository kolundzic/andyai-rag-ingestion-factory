#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🔎 REPO CONTEXT CONFIRMATION"
echo "━━━━━━━━━━━━━━━━━━━━"
echo "Path: $(git rev-parse --show-toplevel)"
echo "Repo: $(basename "$(git rev-parse --show-toplevel)")"
echo "Branch: $(git branch --show-current)"
echo "Latest tag: $(git describe --tags --abbrev=0 2>/dev/null || true)"
echo "Status:"
git status --short
