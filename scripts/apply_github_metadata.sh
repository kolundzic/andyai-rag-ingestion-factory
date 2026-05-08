#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory: self-hosted retrieval lab signal for TurboVec, Qdrant, pgvector, FAISS, LanceDB, strict context answering, and evidence-first RAG."

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
    -f names[]=turbovec \
    -f names[]=qdrant \
    -f names[]=pgvector \
    -f names[]=faiss \
    -f names[]=evidence-pack \
    -f names[]=strict-context \
    -f names[]=knowledge-graph \
    -f names[]=llm-wiki \
    -f names[]=knowledge-factory \
    -f names[]=enterprise-ai \
    -f names[]=andyai || true
fi

echo "🟢 GitHub metadata pass completed."
