#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory: KnowledgeBlock distillation, LLM Wiki bridge, strategic visual atlas, and WikiPress product path."

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" --description "$DESCRIPTION" --homepage "https://knowledgefactory.andyai.ai" --enable-issues=true --enable-wiki=false --enable-projects=false || true
  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=rag \
    -f names[]=knowledge-factory \
    -f names[]=knowledgeblock \
    -f names[]=llm-wiki \
    -f names[]=knowledge-graph \
    -f names[]=wikipress \
    -f names[]=adastranova \
    -f names[]=visual-atlas \
    -f names[]=canon-visuals \
    -f names[]=evidence-pack \
    -f names[]=human-in-the-loop \
    -f names[]=publishing \
    -f names[]=strategy || true
fi
echo "🟢 GitHub metadata pass completed."
