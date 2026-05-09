#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" \
    --description "AndyAI Knowledge Factory with ASAL: structural awareness, repo graph, AST pipeline, MCP graph tools, hybrid RAG+Graph routing and evidence-backed impact maps." \
    --homepage "https://knowledgefactory.andyai.ai" \
    --enable-issues=true --enable-wiki=false --enable-projects=false || true

  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=knowledge-factory \
    -f names[]=asal \
    -f names[]=structural-awareness \
    -f names[]=graph-rag \
    -f names[]=mcp \
    -f names[]=knowledge-graph \
    -f names[]=codebase-analysis \
    -f names[]=ast \
    -f names[]=tree-sitter \
    -f names[]=repo-graph \
    -f names[]=dependency-graph \
    -f names[]=impact-analysis \
    -f names[]=evidence-first || true
fi

echo "🟢 GitHub metadata pass completed."
