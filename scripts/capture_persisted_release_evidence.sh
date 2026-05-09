#!/usr/bin/env bash
set -euo pipefail
VERSION="${1:-unknown}"
BASE_TAG="${2:-unknown}"
HEALTH="${3:-green}"
mkdir -p .release-evidence
cat > ".release-evidence/${VERSION}-persisted.json" <<JSON
{"version":"${VERSION}","base_tag":"${BASE_TAG}","health":"${HEALTH}","status":"ready_for_supabase"}
JSON
echo "🟢 Persisted release evidence prepared: .release-evidence/${VERSION}-persisted.json"
