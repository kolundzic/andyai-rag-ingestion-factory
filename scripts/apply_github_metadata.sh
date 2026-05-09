#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"
DESCRIPTION="AndyAI Knowledge Factory: KnowledgeBlock distillation, WikiPress, Knowledge Curator, Graph Hygiene, Evidence Quality and Guided Action."

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" --description "$DESCRIPTION" --homepage "https://knowledgefactory.andyai.ai" --enable-issues=true --enable-wiki=false --enable-projects=false || true
  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=knowledge-factory \
    -f names[]=wikipress \
    -f names[]=knowledgeblock \
    -f names[]=llm-wiki \
    -f names[]=knowledge-curator \
    -f names[]=graph-hygiene \
    -f names[]=evidence-quality \
    -f names[]=guided-action \
    -f names[]=human-in-the-loop \
    -f names[]=governance \
    -f names[]=rag \
    -f names[]=vercel \
    -f names[]=supabase || true
fi
echo "🟢 GitHub metadata pass completed."
