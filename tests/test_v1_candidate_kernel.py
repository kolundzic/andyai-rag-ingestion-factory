from rag_ingestion_factory.v1_candidate.post_routes import feedback_post_route_contract, pilot_request_post_route_contract
from rag_ingestion_factory.v1_candidate.supabase_adapter import supabase_insert_adapter_status
from rag_ingestion_factory.v1_candidate.admin_protection import protected_admin_review_model
from rag_ingestion_factory.v1_candidate.rls_audit import production_rls_audit_checklist
from rag_ingestion_factory.v1_candidate.vercel_smoke import vercel_build_smoke_standard, public_beta_deploy_smoke_runbook
from rag_ingestion_factory.v1_candidate.tailwind_polish import tailwind_public_beta_polish_pass
from rag_ingestion_factory.v1_candidate.launch_polish import readme_public_launch_polish, v1_candidate_launch_narrative
from rag_ingestion_factory.v1_candidate.proof_pack import final_public_beta_proof_pack
from rag_ingestion_factory.v1_candidate.kernel import public_beta_v1_candidate_kernel_status

def test_v1_candidate_kernel():
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
