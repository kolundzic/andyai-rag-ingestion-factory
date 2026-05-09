#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" --description "AndyAI Knowledge Factory: Guided Knowledge Orchestration with Conductor, retrieval strategy planning, worker assignment, verifier, approval gate and evidence log." --homepage "https://knowledgefactory.andyai.ai" --enable-issues=true --enable-wiki=false --enable-projects=false || true
  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" -f names[]=andyai -f names[]=knowledge-factory -f names[]=rag -f names[]=conductor-layer -f names[]=agent-orchestration -f names[]=guided-action -f names[]=retrieval-strategy -f names[]=human-in-the-loop -f names[]=evidence-log -f names[]=verifier -f names[]=knowledge-graph -f names[]=llm-wiki -f names[]=wikipress -f names[]=sakana-signal || true
fi

echo "🟢 GitHub metadata pass completed."
