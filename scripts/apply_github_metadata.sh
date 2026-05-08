#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory: curated canon visuals, self-hosted retrieval lab, evidence-governed RAG, LLM Wiki, Knowledge Graph, Visual Atlas, and deploy control."

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" \
    --description "$DESCRIPTION" \
    --homepage "https://knowledgefactory.andyai.ai" \
    --enable-issues=true \
    --enable-wiki=false \
    --enable-projects=false || true

  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" \
    -H "Accept: application/vnd.github+json" \
    -f names[]=rag \
    -f names[]=self-hosted-rag \
    -f names[]=vector-search \
    -f names[]=qdrant \
    -f names[]=pgvector \
    -f names[]=faiss \
    -f names[]=evidence-pack \
    -f names[]=strict-context \
    -f names[]=knowledge-graph \
    -f names[]=llm-wiki \
    -f names[]=visual-atlas \
    -f names[]=canon-visuals \
    -f names[]=knowledge-factory \
    -f names[]=andyai || true
fi

echo "🟢 GitHub metadata pass completed."
