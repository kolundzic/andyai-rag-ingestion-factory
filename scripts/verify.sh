#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Public Beta Live Wiring Kernel"
echo "━━━━━━━━━━━━━━━━━━━━"

for f in \
  docs/vercel/VERCEL_ENVIRONMENT_VARIABLE_CONTRACT.md \
  docs/supabase/SUPABASE_CLIENT_WIRING_STANDARD.md \
  docs/public-beta/PUBLIC_FEEDBACK_FORM_LIVE_WIRING.md \
  docs/public-beta/PILOT_REQUEST_FORM_LIVE_WIRING.md \
  docs/supabase/SUPABASE_PUBLIC_INTEREST_TABLE.md \
  docs/supabase/SUPABASE_PILOT_INTAKE_TABLE.md \
  docs/tailwind/TAILWIND_PUBLIC_BETA_DESIGN_SYSTEM.md \
  docs/tailwind/TAILWIND_GLOW_SURFACE_COMPONENTS.md \
  docs/public-beta/PUBLIC_BETA_HERO_SECTION.md \
  docs/public-beta/PUBLIC_BETA_CTA_STRIP.md \
  docs/admin/LIVE_FEEDBACK_ADMIN_VIEW.md \
  docs/admin/LIVE_PILOT_INTAKE_ADMIN_VIEW.md \
  docs/vercel/VERCEL_DEPLOYMENT_READINESS_GATE.md \
  docs/supabase/SUPABASE_RLS_PUBLIC_BETA_POLICY.md \
  docs/public-beta/PUBLIC_BETA_ROUTE_HEALTH_API.md \
  docs/trust/PUBLIC_BETA_TRUST_PROOF_WALL.md \
  docs/launch/PUBLIC_BETA_LAUNCH_COPY_PACK.md \
  docs/public-beta/KNOWLEDGE_FACTORY_PUBLIC_BETA_LIVE_WIRING_KERNEL.md \
  docs/public-beta/V90_CANON_LOCK.md \
  docs/public-beta/V90_NEXT_MASTER_PLAN.md \
  supabase/migrations/20260509_801_public_beta_live_wiring.sql \
  supabase/seeds/public_beta_seed.sql \
  schemas/public-beta-feedback.schema.json \
  schemas/public-beta-pilot-request.schema.json \
  schemas/public-beta-route-health.schema.json \
  examples/public-beta/public-beta-feedback-demo.json \
  examples/public-beta/public-beta-pilot-request-demo.json \
  scripts/print_v90_public_beta_kernel.sh \
  scripts/check_public_beta_env.sh \
  scripts/print_public_beta_routes.sh \
  apps/knowledgefactory-web/lib/publicBeta.ts \
  apps/knowledgefactory-web/lib/publicBetaForms.ts \
  apps/knowledgefactory-web/lib/publicBetaAdmin.ts \
  apps/knowledgefactory-web/app/public-beta/page.tsx \
  apps/knowledgefactory-web/app/api/public-beta/status/route.ts \
  apps/knowledgefactory-web/app/beta-feedback/page.tsx \
  apps/knowledgefactory-web/app/api/beta-feedback/status/route.ts \
  apps/knowledgefactory-web/app/beta-pilot-request/page.tsx \
  apps/knowledgefactory-web/app/api/beta-pilot-request/status/route.ts \
  apps/knowledgefactory-web/app/beta-admin/page.tsx \
  apps/knowledgefactory-web/app/api/beta-admin/status/route.ts \
  apps/knowledgefactory-web/app/beta-trust-wall/page.tsx \
  apps/knowledgefactory-web/app/api/beta-trust-wall/status/route.ts
do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.public_beta.env_contract import vercel_env_contract
from rag_ingestion_factory.public_beta.supabase_client import supabase_client_wiring_status
from rag_ingestion_factory.public_beta.forms import feedback_form_payload, pilot_request_payload
from rag_ingestion_factory.public_beta.tables import public_interest_table_model, pilot_intake_table_model
from rag_ingestion_factory.public_beta.tailwind import tailwind_public_beta_design_system, tailwind_glow_surface_components
from rag_ingestion_factory.public_beta.admin import feedback_admin_view, pilot_intake_admin_view
from rag_ingestion_factory.public_beta.readiness import vercel_deployment_readiness_gate
from rag_ingestion_factory.public_beta.rls import supabase_rls_public_beta_policy
from rag_ingestion_factory.public_beta.route_health import public_beta_route_health
from rag_ingestion_factory.public_beta.trust_wall import public_beta_trust_wall
from rag_ingestion_factory.public_beta.launch_copy import public_beta_launch_copy_pack
from rag_ingestion_factory.public_beta.beta_kernel import public_beta_live_wiring_kernel_status

assert "NEXT_PUBLIC_SUPABASE_URL" in vercel_env_contract()["required"]
assert supabase_client_wiring_status()["status"] == "supabase_client_ready"
assert feedback_form_payload("Andy", "interested")["status"] == "ready_to_submit"
assert pilot_request_payload("Company", "RAG pilot")["status"] == "ready_to_submit"
assert public_interest_table_model()["table"] == "public_interest"
assert pilot_intake_table_model()["table"] == "pilot_intake"
assert tailwind_public_beta_design_system()["status"] == "tailwind_design_ready"
assert tailwind_glow_surface_components()["status"] == "glow_components_ready"
assert feedback_admin_view()["status"] == "feedback_admin_ready"
assert pilot_intake_admin_view()["status"] == "pilot_admin_ready"
assert vercel_deployment_readiness_gate()["status"] == "deployment_gate_ready"
assert supabase_rls_public_beta_policy()["status"] == "rls_policy_ready"
assert public_beta_route_health()["status"] == "green"
assert public_beta_trust_wall()["status"] == "trust_wall_ready"
assert public_beta_launch_copy_pack()["status"] == "launch_copy_ready"
assert public_beta_live_wiring_kernel_status()["version"] == "v90.0.0"
print("🟢 Public beta live wiring Python smoke tests passed")
PY

echo "🟢 VERIFY PASSED"
