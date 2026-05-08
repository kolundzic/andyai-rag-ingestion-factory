#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory: extended canon visuals for approval, Supabase runtime, Vercel deployment, evidence lifecycle, permission-aware access, and end-to-end platform explanation."

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" --description "$DESCRIPTION" --homepage "https://knowledgefactory.andyai.ai" --enable-issues=true --enable-wiki=false --enable-projects=false || true
  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=rag -f names[]=knowledge-graph -f names[]=visual-atlas -f names[]=knowledge-workflows \
    -f names[]=canon-visuals -f names[]=diagramming -f names[]=enterprise-ai -f names[]=qdrant \
    -f names[]=supabase -f names[]=vercel -f names[]=knowledge-factory -f names[]=human-in-the-loop \
    -f names[]=evidence-pack -f names[]=permission-aware -f names[]=andyai || true
fi
echo "🟢 GitHub metadata pass completed."
