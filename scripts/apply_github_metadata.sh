#!/usr/bin/env bash
set -euo pipefail
OWNER="${GITHUB_OWNER:-kolundzic}"
REPO_NAME="${REPO_NAME:-andyai-rag-ingestion-factory}"

if command -v gh >/dev/null 2>&1; then
  gh repo edit "$OWNER/$REPO_NAME" \
    --description "AndyAI Knowledge Factory public alpha: Vercel-ready product surface, real demo navigation, route health, SEO, launch proof and pilot CTA." \
    --homepage "https://knowledgefactory.andyai.ai" \
    --enable-issues=true --enable-wiki=false --enable-projects=false || true

  gh api -X PUT "repos/$OWNER/$REPO_NAME/topics" -H "Accept: application/vnd.github+json" \
    -f names[]=andyai \
    -f names[]=knowledge-factory \
    -f names[]=wikipress \
    -f names[]=public-alpha \
    -f names[]=vercel \
    -f names[]=seo \
    -f names[]=route-health \
    -f names[]=public-demo \
    -f names[]=launch-readiness \
    -f names[]=social-preview \
    -f names[]=mobile-ready \
    -f names[]=pilot-request \
    -f names[]=release-proof \
    -f names[]=product-surface || true
fi

echo "🟢 GitHub metadata pass completed."
