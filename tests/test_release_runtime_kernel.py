from rag_ingestion_factory.release.commit_message import safe_commit_subject
from rag_ingestion_factory.release.dry_run import master_dry_run_plan
from rag_ingestion_factory.release.preflight import release_preflight_status
from rag_ingestion_factory.release.repo_context import repo_context_summary
from rag_ingestion_factory.release.incident import incident_classification
from rag_ingestion_factory.release.evidence_pack import release_evidence_pack
from rag_ingestion_factory.release.runtime_kernel import portable_tap_tap_runtime_status

def test_release_runtime_kernel():
    assert safe_commit_subject("feat: clean title") == "feat: clean title"
    assert safe_commit_subject("${bad}") == "chore: safe release update"
    assert master_dry_run_plan(["v40.0.0"])["status"] == "dry_run_ready"
    assert release_preflight_status("andyai-rag-ingestion-factory")["repo_expected"] == "andyai-rag-ingestion-factory"
    assert repo_context_summary("andyai-rag-ingestion-factory")["canon"].startswith("No TAP-TAP")
    assert incident_classification("metadata", False)["recommended_action"] == "forward_only_patch_version"
    assert release_evidence_pack("v40.0.0", "v35.0.0")["tag_name"] == "v40.0.0"
    assert portable_tap_tap_runtime_status()["version"] == "v40.0.0"
