from rag_ingestion_factory.public_alpha.home_polish import public_home_polish_status
from rag_ingestion_factory.public_alpha.navigation import public_navigation_registry, cta_flow_map
from rag_ingestion_factory.public_alpha.route_health import route_health_check, route_health_summary
from rag_ingestion_factory.public_alpha.seo import seo_metadata, social_preview_metadata
from rag_ingestion_factory.public_alpha.mobile import mobile_readiness_status
from rag_ingestion_factory.public_alpha.vercel import vercel_deploy_checks
from rag_ingestion_factory.public_alpha.proof import public_alpha_proof_panel
from rag_ingestion_factory.public_alpha.launch import launch_announcement_pack, public_alpha_operator_script
from rag_ingestion_factory.public_alpha.surface_kernel import public_alpha_surface_kernel_status

def test_public_alpha_surface_kernel():
    assert public_home_polish_status()["status"] == "home_polish_ready"
    assert "/public-alpha" in public_navigation_registry()["routes"]
    assert cta_flow_map()["primary_cta"] == "/pilot-request"
    assert route_health_check("/public-alpha")["health"] == "green"
    assert route_health_summary(["green", "green"])["status"] == "green"
    assert seo_metadata()["status"] == "seo_ready"
    assert social_preview_metadata()["status"] == "social_preview_ready"
    assert mobile_readiness_status()["status"] == "mobile_ready"
    assert vercel_deploy_checks()["status"] == "vercel_checks_ready"
    assert public_alpha_proof_panel()["status"] == "proof_panel_ready"
    assert launch_announcement_pack()["status"] == "launch_pack_ready"
    assert public_alpha_operator_script()["status"] == "operator_script_ready"
    assert public_alpha_surface_kernel_status()["version"] == "v80.0.0"
