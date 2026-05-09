#!/usr/bin/env bash
set -euo pipefail
EXPECTED_REPO="${1:-andyai-rag-ingestion-factory}"
CURRENT_REPO="$(basename "$(git rev-parse --show-toplevel)")"
if [ "$CURRENT_REPO" != "$EXPECTED_REPO" ]; then
  echo "🔴 Wrong repo: $CURRENT_REPO expected $EXPECTED_REPO"
  exit 1
fi
if [ -n "$(git status --short)" ]; then
  echo "🔴 Working tree is not clean"
  git status --short
  exit 1
fi
echo "🟢 Release preflight passed"
