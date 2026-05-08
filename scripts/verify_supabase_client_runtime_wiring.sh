#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Supabase Client Runtime Wiring"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_supabase_pilot_persistence.sh

for f in \
docs/70-supabase-client-runtime-wiring/SUPABASE_CLIENT_RUNTIME_WIRING.md \
docs/70-supabase-client-runtime-wiring/SUPABASE_ENV_STANDARD.md \
docs/70-supabase-client-runtime-wiring/RUNTIME_ADAPTER_CONTRACT.md \
docs/70-supabase-client-runtime-wiring/SAFE_MOCK_FALLBACK_POLICY.md \
docs/70-supabase-client-runtime-wiring/API_WIRING_PLAN.md \
docs/70-supabase-client-runtime-wiring/VERCEL_ENV_CHECKLIST.md \
docs/70-supabase-client-runtime-wiring/RUNTIME_WIRING_ROADMAP.md \
docs/releases/RELEASE_NOTES_v17.1.0.md \
schemas/supabase-runtime-status.schema.json \
schemas/supabase-adapter-mode.schema.json \
examples/supabase-client-runtime/sample-runtime-status-mock.json \
examples/supabase-client-runtime/sample-runtime-status-ready.json \
apps/knowledgefactory-web/lib/supabaseRuntimeWiring.ts \
apps/knowledgefactory-web/app/pilot-admin/runtime/page.tsx \
apps/knowledgefactory-web/app/api/pilot-request/runtime-demo/route.ts \
src/rag_ingestion_factory/runtime/supabase_runtime.py \
tests/test_supabase_runtime.py; do
  test -f "$f"
done

grep -q "Persistence is the table" apps/knowledgefactory-web/lib/supabaseRuntimeWiring.ts
grep -q "getSupabaseRuntimeStatus" apps/knowledgefactory-web/lib/supabaseRuntimeWiring.ts
grep -q "PilotRuntimePage" apps/knowledgefactory-web/app/pilot-admin/runtime/page.tsx
grep -q "get_supabase_runtime_status" src/rag_ingestion_factory/runtime/supabase_runtime.py
grep -q "NEXT_PUBLIC_SUPABASE_URL" docs/70-supabase-client-runtime-wiring/SUPABASE_ENV_STANDARD.md

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.runtime.supabase_runtime import get_supabase_runtime_status
mock = get_supabase_runtime_status({})
ready = get_supabase_runtime_status({
    "NEXT_PUBLIC_SUPABASE_URL": "https://example.supabase.co",
    "NEXT_PUBLIC_SUPABASE_ANON_KEY": "anon-demo",
})
assert mock.runtime_mode == "mock"
assert ready.runtime_mode == "supabase-client-ready"
assert ready.writes_enabled is False
print("🟢 Python Supabase runtime smoke test passed")
PY

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest -q tests/test_supabase_runtime.py tests/test_pilot_request_persistence.py
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 Supabase env standard present"
echo "🟢 Runtime wiring page present"
echo "🟢 Runtime demo API route present"
echo "🟢 Safe mock fallback present"
echo "🟢 Python runtime adapter present"
echo "🟢 Supabase client runtime wiring verified"
