#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

python3 - <<'PY'
from rag_ingestion_factory.workflows.status import build_v15_workflow_status
import json
print(json.dumps(build_v15_workflow_status(), indent=2, ensure_ascii=False))
PY
