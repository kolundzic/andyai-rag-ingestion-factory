#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Release Intelligence Layer"
echo "━━━━━━━━━━━━━━━━━━━━"
for f in   docs/release-intelligence/REAL_RELEASE_EVIDENCE_GENERATOR.md   docs/release-intelligence/GIT_COMMIT_TAG_CAPTURE_ADAPTER.md   docs/release-intelligence/GITHUB_PUSH_METADATA_CAPTURE.md   docs/release-intelligence/VERIFY_LOG_SNAPSHOT_EXPORT.md   docs/release-intelligence/RELEASE_EVIDENCE_REPORT_BUILDER.md   docs/release-intelligence/RELEASE_COMPARISON_MODEL.md   docs/release-intelligence/PREVIOUS_VS_CURRENT_VERSION_DIFF_SUMMARY.md   docs/release-intelligence/GITHUB_ACTIONS_RELEASE_GUARD_WORKFLOW.md   docs/release-intelligence/CI_PREFLIGHT_PORTABLE_SHELL_CHECK.md   docs/release-intelligence/RELEASE_OPERATOR_CONSOLE_V2.md   docs/release-proof/PUBLIC_RELEASE_PROOF_PAGE.md   docs/release-intelligence/V45_RELEASE_INTELLIGENCE_KERNEL.md   docs/release-intelligence/V45_CANON_LOCK.md   docs/release-intelligence/V45_NEXT_MASTER_PLAN.md   schemas/real-release-evidence.schema.json   schemas/release-comparison.schema.json   schemas/release-proof.schema.json   examples/release-intelligence/release-evidence-demo.json   examples/release-intelligence/release-comparison-demo.json   .github/workflows/release-guard.yml   scripts/capture_release_evidence.sh   scripts/export_release_proof.sh   scripts/compare_release_versions.sh   scripts/print_v45_release_intelligence.sh   apps/knowledgefactory-web/app/release-operator-v2/page.tsx   apps/knowledgefactory-web/app/api/release-operator-v2/status/route.ts   apps/knowledgefactory-web/app/release-proof/page.tsx   apps/knowledgefactory-web/app/api/release-proof/status/route.ts
do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
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

assert real_release_evidence("v45.0.0", "v40.0.0")["status"] == "evidence_ready"
assert git_commit_tag_capture("abc", "v45.0.0")["tag"] == "v45.0.0"
assert github_push_metadata("main", "v45.0.0")["push_status"] == "captured"
assert verify_log_snapshot("VERIFY PASSED")["passed"] is True
assert release_evidence_report("v45.0.0")["formats"] == ["json", "markdown"]
assert release_comparison("v44.0.0", "v45.0.0")["current"] == "v45.0.0"
assert previous_vs_current_summary("v44.0.0", "v45.0.0")["status"] == "summary_ready"
assert ci_guard_status()["portable_shell_check"] == "enabled"
assert public_release_proof("v45.0.0")["visibility"] == "public-demo"
assert release_intelligence_kernel_status()["version"] == "v45.0.0"
print("🟢 Release intelligence Python smoke tests passed")
PY

echo "🟢 VERIFY PASSED"
