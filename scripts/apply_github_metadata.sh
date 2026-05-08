#!/usr/bin/env bash
set -euo pipefail

OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="Production-grade RAG ingestion factory for large PDF libraries: PDF parsing, page-aware chunking, PostgreSQL metadata, Qdrant, evidence packs, and hybrid retrieval architecture."

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
  --add-topic retrieval-augmented-generation \
  --add-topic pdf-processing \
  --add-topic document-ai \
  --add-topic ingestion-pipeline \
  --add-topic vector-search \
  --add-topic qdrant \
  --add-topic postgresql \
  --add-topic metadata \
  --add-topic citations \
  --add-topic evidence-pack \
  --add-topic hybrid-search \
  --add-topic fastapi \
  --add-topic llm \
  --add-topic ai-engineering \
  --add-topic knowledge-base \
  --add-topic andyai || true

echo "🟢 GitHub metadata pass completed."
