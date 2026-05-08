#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

python3 - <<'PY'
from rag_ingestion_factory.knowledge_graph.status import build_v13_knowledge_graph_status
import json
print(json.dumps(build_v13_knowledge_graph_status(), indent=2, ensure_ascii=False))
PY
