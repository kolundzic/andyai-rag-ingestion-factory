#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"
python3 - <<'PY'
from rag_ingestion_factory.knowledge_os.status import build_knowledge_os_status
import json
print(json.dumps(build_knowledge_os_status(), indent=2, ensure_ascii=False))
PY
