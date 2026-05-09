#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" \
    --description "AndyAI Knowledge Factory v1 candidate: public beta with Supabase POST wiring, protected admin model, RLS audit, Vercel smoke, Tailwind polish and launch proof." \
    --homepage "https://knowledgefactory.andyai.ai" \
    --enable-issues=true --enable-wiki=false --enable-projects=false || true

  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=knowledge-factory \
    -f names[]=wikipress \
    -f names[]=public-beta \
    -f names[]=v1-candidate \
    -f names[]=vercel \
    -f names[]=supabase \
    -f names[]=tailwind \
    -f names[]=rls-audit \
    -f names[]=protected-admin \
    -f names[]=post-routes \
    -f names[]=launch-proof \
    -f names[]=enterprise-ai \
    -f names[]=evidence-backed || true
fi

echo "🟢 GitHub metadata pass completed."
