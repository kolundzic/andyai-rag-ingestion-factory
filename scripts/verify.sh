#!/usr/bin/env bash
set -euo pipefail

export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v4.0.0 — Operator Evidence Console"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from pathlib import Path
from rag_ingestion_factory.operator.console import run_operator_console_demo

report = run_operator_console_demo(
    "examples/sample_documents/demo_document.txt",
    "What does the ingestion pipeline prepare?",
    "examples/output/operator_console_verify",
)

assert report["readiness"]["score"] >= 90
assert report["evidence_pack"]["citations"]
assert report["audit_summary"]["failures"] == 0

outputs = report["outputs"]
for path in outputs.values():
    assert Path(path).exists(), path

print("🟢 Operator console report generated")
print(f"🟢 Readiness score: {report['readiness']['score']}")
print(f"🟢 Readiness level: {report['readiness']['level']}")
PY

python3 - <<'PY'
import rag_ingestion_factory.api.app as app_module
assert hasattr(app_module, "OperatorDemoRequest")
print("🟢 API operator endpoint import passed")
PY

test -f docs/20-operator-console/OPERATOR_CONSOLE_v4_0.md
test -f docs/21-evidence-bundle/RELEASE_EVIDENCE_BUNDLE_v4_0.md
test -f docs/22-demo/DEMO_SCRIPT_v4_0.md
test -f docs/releases/RELEASE_NOTES_v4.0.0.md
test -f src/rag_ingestion_factory/operator/console.py
test -f src/rag_ingestion_factory/operator/readiness.py
test -f src/rag_ingestion_factory/reports/json_report.py
test -f src/rag_ingestion_factory/reports/html_report.py
test -f scripts/run_operator_console_demo.sh

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🟢 VERIFY PASSED"
echo "━━━━━━━━━━━━━━━━━━━━"
