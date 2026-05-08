#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

python3 - <<'PY'
from rag_ingestion_factory.control_tower.status import build_v16_control_tower_status
import json
print(json.dumps(build_v16_control_tower_status(), indent=2, ensure_ascii=False))
PY
