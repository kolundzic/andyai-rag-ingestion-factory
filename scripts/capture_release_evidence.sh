#!/usr/bin/env bash
set -euo pipefail
VERSION="${1:-unknown}"
BASE_TAG="${2:-unknown}"
mkdir -p .release-evidence
cat > ".release-evidence/${VERSION}.json" <<JSON
{"version":"${VERSION}","base_tag":"${BASE_TAG}","status":"captured"}
JSON
echo "🟢 Release evidence captured: .release-evidence/${VERSION}.json"
