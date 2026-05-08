#!/usr/bin/env bash
set -euo pipefail

OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory: production deploy control tower for evidence-governed RAG, Knowledge Graph, Visual Atlas, and agentic workflows."

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🌍 Applying GitHub metadata"
echo "Repo: $OWNER/$REPO_NAME"
echo "━━━━━━━━━━━━━━━━━━━━"

if ! command -v gh >/dev/null 2>&1; then
  echo "🟡 GitHub CLI not found; skipping GitHub metadata."
  exit 0
fi

gh repo edit "$OWNER/$REPO_NAME" \
  --description "$DESCRIPTION" \
  --homepage "https://knowledgefactory.andyai.ai" \
  --enable-issues=true \
  --enable-wiki=false \
  --enable-projects=false || true

gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" \
  -H "Accept: application/vnd.github+json" \
  -f names[]=rag \
  -f names[]=knowledge-graph \
  -f names[]=visual-atlas \
  -f names[]=agentic-ai \
  -f names[]=knowledge-workflows \
  -f names[]=deploy-control \
  -f names[]=production-readiness \
  -f names[]=sovereign-ai \
  -f names[]=enterprise-ai \
  -f names[]=qdrant \
  -f names[]=supabase \
  -f names[]=vercel \
  -f names[]=evidence-pack \
  -f names[]=knowledge-factory \
  -f names[]=andyai || true

echo "🟢 GitHub metadata pass completed."
