#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" \
    --description "AndyAI Knowledge Factory: public alpha surface for governed RAG, KnowledgeBlocks, Conductor orchestration, evidence, approval and release proof." \
    --homepage "https://knowledgefactory.andyai.ai" \
    --enable-issues=true --enable-wiki=false --enable-projects=false || true

  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=knowledge-factory \
    -f names[]=rag \
    -f names[]=wikipress \
    -f names[]=public-alpha \
    -f names[]=vercel \
    -f names[]=conductor-layer \
    -f names[]=knowledgeblocks \
    -f names[]=evidence-pack \
    -f names[]=human-in-the-loop \
    -f names[]=release-proof \
    -f names[]=public-demo \
    -f names[]=feedback-loop \
    -f names[]=ai-orchestration || true
fi

echo "🟢 GitHub metadata pass completed."
