#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_knowledgeblock_base.sh
if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest -q tests/test_knowledgeblock_model.py
else
  echo "🟡 pytest not installed; skipped unit tests"
fi
echo "🟢 VERIFY PASSED"
