#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" \
    --description "AndyAI Knowledge Factory: Knowledge Curator persistence, operator command center, scheduled hygiene, evidence trails, health score and production demo kernel." \
    --homepage "https://knowledgefactory.andyai.ai" \
    --enable-issues=true --enable-wiki=false --enable-projects=false || true

  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=knowledge-factory \
    -f names[]=knowledge-curator \
    -f names[]=curator-queue \
    -f names[]=graph-hygiene \
    -f names[]=evidence-quality \
    -f names[]=operator-console \
    -f names[]=human-in-the-loop \
    -f names[]=supabase \
    -f names[]=vercel \
    -f names[]=audit-trail \
    -f names[]=production-demo \
    -f names[]=wikipress || true
fi

echo "🟢 GitHub metadata pass completed."
