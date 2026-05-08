#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v6.0.0"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.knowledge_os.status import build_knowledge_os_status
status = build_knowledge_os_status()
assert status["repo"] == "andyai-rag-ingestion-factory"
assert status["version"]
print("🟢 Knowledge OS status import passed")
PY

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
