#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

python3 - <<'PY'
from rag_ingestion_factory.supabase.runtime_schema import build_supabase_runtime_status
import json
print(json.dumps(build_supabase_runtime_status(), indent=2, ensure_ascii=False))
PY
