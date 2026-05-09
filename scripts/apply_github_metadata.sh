#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" \
    --description "AndyAI Knowledge Factory: polished public beta v1 candidate docs, visual atlas, Mermaid architecture, Supabase/Vercel/Tailwind proof and enterprise-ready README." \
    --homepage "https://knowledgefactory.andyai.ai" \
    --enable-issues=true --enable-wiki=false --enable-projects=false || true

  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=knowledge-factory \
    -f names[]=wikipress \
    -f names[]=public-beta \
    -f names[]=v1-candidate \
    -f names[]=readme-polish \
    -f names[]=documentation \
    -f names[]=visual-atlas \
    -f names[]=mermaid \
    -f names[]=vercel \
    -f names[]=supabase \
    -f names[]=tailwind \
    -f names[]=evidence-first \
    -f names[]=human-in-the-loop || true
fi

echo "🟢 GitHub metadata pass completed."
