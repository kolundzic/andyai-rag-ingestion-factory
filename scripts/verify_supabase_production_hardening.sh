#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Supabase Production Hardening Layer"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_pilot_audit_trail.sh

for f in \
docs/74-supabase-production-hardening/SUPABASE_PRODUCTION_HARDENING_LAYER.md \
docs/74-supabase-production-hardening/TENANT_BOUND_RLS_STANDARD.md \
docs/74-supabase-production-hardening/WORKSPACE_ACCESS_MODEL.md \
docs/74-supabase-production-hardening/SERVICE_ROLE_KEY_POLICY.md \
docs/74-supabase-production-hardening/PRODUCTION_SECURITY_CHECKLIST.md \
docs/74-supabase-production-hardening/VERCEL_SUPABASE_ENV_HARDENING.md \
db/supabase/migrations/019_production_rls_policy_templates.sql \
schemas/tenant-access-policy.schema.json \
schemas/workspace-access-policy.schema.json \
apps/knowledgefactory-web/lib/supabaseSecurityHardening.ts \
apps/knowledgefactory-web/app/pilot-admin/security/page.tsx \
src/rag_ingestion_factory/runtime/security_hardening.py \
tests/test_security_hardening.py; do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.runtime.security_hardening import score_security_readiness
assert score_security_readiness(["tenant-bound RLS"])["score"] == 20
print("🟢 Security hardening Python smoke test passed")
PY
echo "🟢 Supabase production hardening verified"
