#!/usr/bin/env bash
set -euo pipefail

export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

python3 - <<'PY'
from rag_ingestion_factory.factory.sovereign_status import build_sovereign_factory_status
import json
print(json.dumps(build_sovereign_factory_status(), indent=2, ensure_ascii=False))
PY
