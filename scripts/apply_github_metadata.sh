#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory: pilot intake admin review layer for scoring, triaging, and operating document intelligence pilot requests."

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" \
    --description "$DESCRIPTION" \
    --homepage "https://knowledgefactory.andyai.ai" \
    --enable-issues=true \
    --enable-wiki=false \
    --enable-projects=false || true

  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" \
    -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=rag \
    -f names[]=knowledge-factory \
    -f names[]=pilot-admin \
    -f names[]=pilot-request \
    -f names[]=client-pitch \
    -f names[]=visual-atlas \
    -f names[]=evidence-pack \
    -f names[]=human-in-the-loop \
    -f names[]=permission-aware \
    -f names[]=enterprise-ai \
    -f names[]=knowledge-graph \
    -f names[]=llm-wiki \
    -f names[]=operator-console || true
fi
echo "🟢 GitHub metadata pass completed."
