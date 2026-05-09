#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" --description "AndyAI Knowledge Factory: portable TAP-TAP runtime, preflight guard, dry run, release evidence packs and forward-only incident handling." --homepage "https://knowledgefactory.andyai.ai" --enable-issues=true --enable-wiki=false --enable-projects=false || true
  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" -f names[]=andyai -f names[]=knowledge-factory -f names[]=tap-tap -f names[]=portable-shell -f names[]=release-guard -f names[]=preflight -f names[]=dry-run -f names[]=evidence-pack -f names[]=incident-handling -f names[]=operator-console -f names[]=vercel -f names[]=github-actions -f names[]=release-runtime -f names[]=wikipress || true
fi

echo "🟢 GitHub metadata pass completed."
