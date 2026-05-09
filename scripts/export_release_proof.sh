#!/usr/bin/env bash
set -euo pipefail
VERSION="${1:-unknown}"
mkdir -p .release-proof
cat > ".release-proof/${VERSION}.md" <<EOF2
# Release Proof — ${VERSION}

Status: captured

Formula: Run → Verify → Capture Evidence → Commit/Tag/Push → Export Proof
EOF2
echo "🟢 Release proof exported: .release-proof/${VERSION}.md"
