#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v12.0.0 — Live Qdrant Pipeline"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.qdrant_live.status import build_live_qdrant_pipeline_status
status = build_live_qdrant_pipeline_status()
assert status["pipeline"] == "live-qdrant-ready"
assert "qdrant_collection" in status["flow"]
assert status["site"] == "knowledgefactory.andyai.ai"
print("🟢 Live Qdrant pipeline status passed")
PY

test -f docs/54-live-qdrant/LIVE_QDRANT_PIPELINE_v12_0.md
test -f docs/releases/RELEASE_NOTES_v12.0.0.md
test -f apps/knowledgefactory-web/app/api/qdrant/demo/route.ts
test -f apps/knowledgefactory-web/app/qdrant/page.tsx

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
