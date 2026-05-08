#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory and WikiPress launch kernel: KnowledgeBlock distillation, LLM Wiki, publishing pipeline, workspaces, and product runtime."

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" --description "$DESCRIPTION" --homepage "https://knowledgefactory.andyai.ai" --enable-issues=true --enable-wiki=false --enable-projects=false || true
  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=knowledge-factory \
    -f names[]=wikipress \
    -f names[]=llm-wiki \
    -f names[]=knowledgeblock \
    -f names[]=knowledge-graph \
    -f names[]=publishing \
    -f names[]=product-runtime \
    -f names[]=workspace \
    -f names[]=supabase \
    -f names[]=vercel \
    -f names[]=saas \
    -f names[]=launch-kernel \
    -f names[]=evidence-pack || true
fi
echo "🟢 GitHub metadata pass completed."
