#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Public Beta / v1.0 Candidate Arc"
echo "━━━━━━━━━━━━━━━━━━━━"

for f in \
  docs/api/REAL_PUBLIC_FEEDBACK_POST_ROUTE.md \
  docs/api/REAL_PILOT_REQUEST_POST_ROUTE.md \
  docs/supabase/SUPABASE_INSERT_ADAPTER_STANDARD.md \
  docs/admin/PROTECTED_ADMIN_REVIEW_MODEL.md \
  docs/supabase/PRODUCTION_RLS_AUDIT_CHECKLIST.md \
  docs/vercel/VERCEL_BUILD_SMOKE_STANDARD.md \
  docs/vercel/PUBLIC_BETA_DEPLOY_SMOKE_RUNBOOK.md \
  docs/tailwind/TAILWIND_PUBLIC_BETA_POLISH_PASS.md \
  docs/launch/README_PUBLIC_LAUNCH_POLISH.md \
  docs/trust/FINAL_PUBLIC_BETA_PROOF_PACK.md \
  docs/launch/V1_CANDIDATE_LAUNCH_NARRATIVE.md \
  docs/v1-candidate/V100_PUBLIC_BETA_V1_CANDIDATE_KERNEL.md \
  docs/v1-candidate/V100_CANON_LOCK.md \
  docs/v1-candidate/V100_NEXT_MASTER_PLAN.md \
  schemas/feedback-post-request.schema.json \
  schemas/pilot-request-post.schema.json \
  schemas/protected-admin-action.schema.json \
  schemas/v1-candidate-proof.schema.json \
  examples/v1-candidate/feedback-post-demo.json \
  examples/v1-candidate/pilot-request-post-demo.json \
  examples/v1-candidate/v1-candidate-proof-demo.json \
  scripts/print_v100_candidate_kernel.sh \
  scripts/run_v1_candidate_smoke.sh \
  scripts/print_v1_launch_narrative.sh \
  apps/knowledgefactory-web/lib/v1Candidate.ts \
  apps/knowledgefactory-web/lib/v1SubmitAdapters.ts \
  apps/knowledgefactory-web/app/api/beta-feedback/submit/route.ts \
  apps/knowledgefactory-web/app/api/beta-pilot-request/submit/route.ts \
  apps/knowledgefactory-web/app/api/beta-admin/protected-status/route.ts \
  apps/knowledgefactory-web/app/v1-candidate/page.tsx \
  apps/knowledgefactory-web/app/api/v1-candidate/status/route.ts \
  apps/knowledgefactory-web/app/v1-proof/page.tsx \
  apps/knowledgefactory-web/app/api/v1-proof/status/route.ts
do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.v1_candidate.post_routes import feedback_post_route_contract, pilot_request_post_route_contract
from rag_ingestion_factory.v1_candidate.supabase_adapter import supabase_insert_adapter_status
from rag_ingestion_factory.v1_candidate.admin_protection import protected_admin_review_model
from rag_ingestion_factory.v1_candidate.rls_audit import production_rls_audit_checklist
from rag_ingestion_factory.v1_candidate.vercel_smoke import vercel_build_smoke_standard, public_beta_deploy_smoke_runbook
from rag_ingestion_factory.v1_candidate.tailwind_polish import tailwind_public_beta_polish_pass
from rag_ingestion_factory.v1_candidate.launch_polish import readme_public_launch_polish, v1_candidate_launch_narrative
from rag_ingestion_factory.v1_candidate.proof_pack import final_public_beta_proof_pack
from rag_ingestion_factory.v1_candidate.kernel import public_beta_v1_candidate_kernel_status

assert feedback_post_route_contract()["route"] == "/api/beta-feedback/submit"
assert pilot_request_post_route_contract()["route"] == "/api/beta-pilot-request/submit"
assert supabase_insert_adapter_status()["status"] == "insert_adapter_ready"
assert protected_admin_review_model()["status"] == "protected_admin_model_ready"
assert production_rls_audit_checklist()["status"] == "rls_audit_ready"
assert vercel_build_smoke_standard()["status"] == "vercel_smoke_ready"
assert public_beta_deploy_smoke_runbook()["status"] == "deploy_smoke_ready"
assert tailwind_public_beta_polish_pass()["status"] == "tailwind_polish_ready"
assert readme_public_launch_polish()["status"] == "readme_launch_polish_ready"
assert final_public_beta_proof_pack()["status"] == "proof_pack_ready"
assert v1_candidate_launch_narrative()["status"] == "launch_narrative_ready"
assert public_beta_v1_candidate_kernel_status()["version"] == "v100.0.0"
print("🟢 v1 candidate Python smoke tests passed")
PY

echo "🟢 VERIFY PASSED"
