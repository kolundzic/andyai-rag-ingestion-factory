#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory: canon visual pack integrated for project explanation, alongside deploy control, workflows, atlas, graph, and RAG foundations."
if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" --description "$DESCRIPTION" --homepage "https://knowledgefactory.andyai.ai" --enable-issues=true --enable-wiki=false --enable-projects=false || true
  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=rag -f names[]=knowledge-graph -f names[]=visual-atlas -f names[]=knowledge-workflows \
    -f names[]=production-readiness -f names[]=deploy-control -f names[]=canon-visuals -f names[]=diagramming \
    -f names[]=enterprise-ai -f names[]=qdrant -f names[]=supabase -f names[]=vercel -f names[]=knowledge-factory -f names[]=andyai || true
fi
echo "🟢 GitHub metadata pass completed."
