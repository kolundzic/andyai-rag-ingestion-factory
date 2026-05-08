#!/usr/bin/env bash
set -euo pipefail

OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory: Supabase-ready sovereign evidence-governed RAG runtime for serious document intelligence."

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
  -f names[]=sovereign-ai \
  -f names[]=enterprise-ai \
  -f names[]=document-ai \
  -f names[]=qdrant \
  -f names[]=postgresql \
  -f names[]=supabase \
  -f names[]=rls \
  -f names[]=permission-aware \
  -f names[]=context-board \
  -f names[]=evidence-pack \
  -f names[]=hybrid-search \
  -f names[]=nextjs \
  -f names[]=vercel \
  -f names[]=andyai || true

echo "🟢 GitHub metadata pass completed."
