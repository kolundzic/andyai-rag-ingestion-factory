#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

python3 - <<'PY3'
from rag_ingestion_factory.retrieval_lab.status import build_v16_3_retrieval_lab_status
import json
print(json.dumps(build_v16_3_retrieval_lab_status(), indent=2, ensure_ascii=False))
PY3
