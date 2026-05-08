#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v11.0.0 — Runtime API + Web Demo"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.api_runtime.status import build_runtime_api_status
status = build_runtime_api_status()
assert "/api/health" in status["routes"]
assert "/api/evidence/demo" in status["routes"]
assert status["site"] == "knowledgefactory.andyai.ai"
print("🟢 Runtime API status passed")
PY

test -f docs/53-runtime-api/RUNTIME_API_WEB_DEMO_v11_0.md
test -f apps/knowledgefactory-web/app/api/health/route.ts
test -f apps/knowledgefactory-web/app/api/runtime/status/route.ts
test -f apps/knowledgefactory-web/app/api/evidence/demo/route.ts
test -f apps/knowledgefactory-web/app/api/context-board/demo/route.ts
test -f apps/knowledgefactory-web/app/runtime/page.tsx

echo "🟢 VERIFY PASSED"
