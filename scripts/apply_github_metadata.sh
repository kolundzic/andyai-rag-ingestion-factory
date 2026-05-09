#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" --description "AndyAI Knowledge Factory: evidence-backed TAP-TAP release intelligence, proof pages, comparison reports and CI release guard." --homepage "https://knowledgefactory.andyai.ai" --enable-issues=true --enable-wiki=false --enable-projects=false || true
  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" -f names[]=andyai -f names[]=knowledge-factory -f names[]=tap-tap -f names[]=release-intelligence -f names[]=release-proof -f names[]=evidence-pack -f names[]=github-actions -f names[]=ci-guard -f names[]=version-comparison -f names[]=operator-console -f names[]=vercel -f names[]=audit-trail -f names[]=wikipress || true
fi

echo "🟢 GitHub metadata pass completed."
