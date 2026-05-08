#!/usr/bin/env bash
set -euo pipefail

OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="Sovereign evidence-governed knowledge factory for large document libraries: ingestion, permissions, retrieval, evidence, context boards, drafting, approval, observability, and release governance."

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
  --enable-issues=true \
  --enable-wiki=false \
  --enable-projects=false || true

# Use controlled topic list under GitHub 20-topic limit.
gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" \
  -H "Accept: application/vnd.github+json" \
  -f names[]=rag \
  -f names[]=sovereign-ai \
  -f names[]=enterprise-ai \
  -f names[]=document-ai \
  -f names[]=qdrant \
  -f names[]=postgresql \
  -f names[]=permission-aware \
  -f names[]=context-board \
  -f names[]=evidence-pack \
  -f names[]=hybrid-search \
  -f names[]=fastapi \
  -f names[]=knowledge-os \
  -f names[]=ai-engineering \
  -f names[]=andyai || true

echo "🟢 GitHub metadata pass completed."
