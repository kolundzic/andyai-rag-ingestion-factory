#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v10.5.0 — Public RAG Playground MVP"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.web_demo.playground import build_playground_demo_response
response = build_playground_demo_response("What does the ingestion pipeline prepare?")
assert response["evidence_pack"]["citations"]
assert response["public_rule"] == "No citation, no trusted answer."
print("🟢 Playground evidence demo passed")
PY

test -f docs/52-public-playground/PUBLIC_RAG_PLAYGROUND_MVP_v10_5.md
test -f apps/knowledgefactory-web/lib/demo.ts
test -f apps/knowledgefactory-web/app/playground/page.tsx
test -f apps/knowledgefactory-web/app/api/playground/demo/route.ts

echo "🟢 VERIFY PASSED"
