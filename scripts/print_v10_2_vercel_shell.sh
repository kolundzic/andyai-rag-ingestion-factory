#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

python3 - <<'PY'
from rag_ingestion_factory.product.vercel_shell import build_vercel_shell_status
import json
print(json.dumps(build_vercel_shell_status(), indent=2, ensure_ascii=False))
PY
