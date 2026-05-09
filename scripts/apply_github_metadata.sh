#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" \
    --description "AndyAI Knowledge Factory public beta: Vercel + Supabase live wiring, Tailwind glow surface, feedback/pilot forms, admin views, route health and trust wall." \
    --homepage "https://knowledgefactory.andyai.ai" \
    --enable-issues=true --enable-wiki=false --enable-projects=false || true

  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=knowledge-factory \
    -f names[]=wikipress \
    -f names[]=public-beta \
    -f names[]=vercel \
    -f names[]=supabase \
    -f names[]=tailwind \
    -f names[]=rls \
    -f names[]=pilot-request \
    -f names[]=feedback-form \
    -f names[]=admin-console \
    -f names[]=trust-wall \
    -f names[]=route-health \
    -f names[]=live-wiring || true
fi

echo "🟢 GitHub metadata pass completed."
