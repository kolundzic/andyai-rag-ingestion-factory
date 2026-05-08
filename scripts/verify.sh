#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v10.4.0 — Auth + RLS Permission Model"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.api_runtime.status import build_runtime_api_status
from rag_ingestion_factory.web_demo.playground import build_playground_demo_response
from rag_ingestion_factory.qdrant_live.status import build_live_qdrant_pipeline_status

runtime = build_runtime_api_status()
playground = build_playground_demo_response("What does the ingestion pipeline prepare?")
qdrant = build_live_qdrant_pipeline_status()

assert runtime["site"] == "knowledgefactory.andyai.ai"
assert playground["evidence_pack"]["citations"]
assert qdrant["pipeline"] == "live-qdrant-ready"

print("🟢 Runtime API status passed")
print("🟢 Playground demo response passed")
print("🟢 Live Qdrant pipeline status passed")
PY

test -f docs/51-auth-rls/AUTH_RLS_PERMISSION_MODEL_v10_4.md
test -f docs/51-auth-rls/RLS_POLICY_MAP_v10_4.md
test -f supabase/policies/002_auth_rls_workspace_policies.sql
test -f src/rag_ingestion_factory/api_runtime/status.py
test -f src/rag_ingestion_factory/web_demo/playground.py
test -f src/rag_ingestion_factory/qdrant_live/status.py

echo "🟢 VERIFY PASSED"
