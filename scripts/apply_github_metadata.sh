#!/usr/bin/env bash
set -euo pipefail

OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="Sovereign evidence-governed RAG factory for large PDF libraries with permissions, Context Board, Qdrant, PostgreSQL metadata, and enterprise AI architecture."

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

gh repo edit "$OWNER/$REPO_NAME" \
  --add-topic rag \
  --add-topic sovereign-ai \
  --add-topic enterprise-ai \
  --add-topic retrieval-augmented-generation \
  --add-topic pdf-processing \
  --add-topic document-ai \
  --add-topic ingestion-pipeline \
  --add-topic vector-search \
  --add-topic qdrant \
  --add-topic postgresql \
  --add-topic permission-aware \
  --add-topic context-board \
  --add-topic evidence-pack \
  --add-topic external-gateway \
  --add-topic hybrid-search \
  --add-topic fastapi \
  --add-topic ai-engineering \
  --add-topic andyai || true

echo "🟢 GitHub metadata pass completed."
