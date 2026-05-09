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

def test_public_beta_kernel():
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
