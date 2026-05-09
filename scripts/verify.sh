#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Portable Shell + Release Runtime Kernel"
echo "━━━━━━━━━━━━━━━━━━━━"
for f in   docs/releases/V35_METADATA_NOTE.md   docs/dev/MACOS_BASH_COMPATIBILITY_RULE.md   docs/dev/MASTER_UDARAC_PORTABLE_SHELL_STANDARD.md   docs/dev/PORTABLE_MASTER_UDARAC_SCRIPT_STANDARD.md   docs/dev/BASH_3_2_SAFE_SCRIPTING_GUIDE.md   docs/dev/COMMIT_MESSAGE_SAFETY_LAYER.md   docs/dev/MASTER_UDARAC_DRY_RUN_MODE.md   docs/dev/RELEASE_GUARD_PREFLIGHT_LAYER.md   docs/dev/REPO_CONTEXT_CONFIRMATION_GATE.md   docs/dev/FORWARD_ONLY_INCIDENT_HANDLING_STANDARD.md   docs/dev/NO_HISTORY_REWRITE_POLICY.md   docs/incidents/INCIDENT_REPORT_TEMPLATE.md   docs/dev/TAP_TAP_RELEASE_EVIDENCE_PACK.md   docs/dev/RELEASE_OPERATOR_CONSOLE_PAGE.md   docs/dev/PORTABLE_TAP_TAP_RUNTIME_KERNEL.md   docs/dev/V40_CANON_LOCK.md   docs/dev/V40_NEXT_MASTER_PLAN.md   scripts/lib/portable_shell.sh   scripts/master_dry_run_check.sh   scripts/release_preflight_guard.sh   scripts/confirm_repo_context.sh   scripts/print_v40_runtime_kernel.sh   apps/knowledgefactory-web/app/release-operator/page.tsx   apps/knowledgefactory-web/app/api/release-operator/status/route.ts
do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.release.commit_message import safe_commit_subject
from rag_ingestion_factory.release.dry_run import master_dry_run_plan
from rag_ingestion_factory.release.preflight import release_preflight_status
from rag_ingestion_factory.release.repo_context import repo_context_summary
from rag_ingestion_factory.release.incident import incident_classification
from rag_ingestion_factory.release.evidence_pack import release_evidence_pack
from rag_ingestion_factory.release.runtime_kernel import portable_tap_tap_runtime_status
assert safe_commit_subject("feat: Test Title") == "feat: Test Title"
assert safe_commit_subject("${bad}") == "chore: safe release update"
assert master_dry_run_plan(["v35.0.1"])["status"] == "dry_run_ready"
assert release_preflight_status("andyai-rag-ingestion-factory")["repo_expected"] == "andyai-rag-ingestion-factory"
assert repo_context_summary("andyai-rag-ingestion-factory")["repo_name"] == "andyai-rag-ingestion-factory"
assert incident_classification("metadata", False)["history_rewrite_required"] is False
assert release_evidence_pack("v40.0.0", "v35.0.0")["version"] == "v40.0.0"
assert portable_tap_tap_runtime_status()["version"] == "v40.0.0"
print("🟢 Release runtime Python smoke tests passed")
PY

echo "🟢 VERIFY PASSED"
