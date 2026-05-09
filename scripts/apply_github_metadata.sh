#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" --description "AndyAI Knowledge Factory: Supabase-backed release evidence persistence, live operator dashboard and release history memory." --homepage "https://knowledgefactory.andyai.ai" --enable-issues=true --enable-wiki=false --enable-projects=false || true
  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" -f names[]=andyai -f names[]=knowledge-factory -f names[]=wikipress -f names[]=tap-tap -f names[]=release-intelligence -f names[]=release-proof -f names[]=release-history -f names[]=supabase -f names[]=rls -f names[]=operator-dashboard -f names[]=live-dashboard -f names[]=evidence-store -f names[]=audit-trail -f names[]=vercel || true
fi

echo "🟢 GitHub metadata pass completed."
