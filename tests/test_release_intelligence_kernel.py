from rag_ingestion_factory.release.real_evidence import real_release_evidence
from rag_ingestion_factory.release.git_capture import git_commit_tag_capture
from rag_ingestion_factory.release.github_capture import github_push_metadata
from rag_ingestion_factory.release.verify_snapshot import verify_log_snapshot
from rag_ingestion_factory.release.report_builder import release_evidence_report
from rag_ingestion_factory.release.comparison import release_comparison
from rag_ingestion_factory.release.diff_summary import previous_vs_current_summary
from rag_ingestion_factory.release.ci_guard import ci_guard_status
from rag_ingestion_factory.release.proof_page import public_release_proof
from rag_ingestion_factory.release.intelligence_kernel import release_intelligence_kernel_status

def test_release_intelligence_kernel():
    assert real_release_evidence("v45.0.0", "v40.0.0")["status"] == "evidence_ready"
    assert git_commit_tag_capture("abc", "v45.0.0")["status"] == "captured"
    assert github_push_metadata("main", "v45.0.0")["push_status"] == "captured"
    assert verify_log_snapshot("VERIFY PASSED")["passed"] is True
    assert release_evidence_report("v45.0.0")["status"] == "report_ready"
    assert release_comparison("v44.0.0", "v45.0.0")["status"] == "comparison_ready"
    assert previous_vs_current_summary("v44.0.0", "v45.0.0")["status"] == "summary_ready"
    assert ci_guard_status()["preflight"] == "enabled"
    assert public_release_proof("v45.0.0")["status"] == "proof_ready"
    assert release_intelligence_kernel_status()["version"] == "v45.0.0"
