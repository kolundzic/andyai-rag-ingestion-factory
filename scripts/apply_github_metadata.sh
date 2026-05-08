#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory: Canon Visual Master Atlas with 14 curated diagrams for evidence-governed RAG, LLM Wiki, Knowledge Graph, Visual Atlas, and deploy control."

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
    -f names[]=knowledge-factory \
    -f names[]=knowledge-graph \
    -f names[]=llm-wiki \
    -f names[]=visual-atlas \
    -f names[]=canon-visuals \
    -f names[]=diagramming \
    -f names[]=evidence-pack \
    -f names[]=human-in-the-loop \
    -f names[]=permission-aware \
    -f names[]=self-hosted-rag \
    -f names[]=vector-search \
    -f names[]=enterprise-ai \
    -f names[]=andyai || true
fi

echo "🟢 GitHub metadata pass completed."
