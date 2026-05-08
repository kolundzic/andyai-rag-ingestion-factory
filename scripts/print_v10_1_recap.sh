#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

python3 - <<'PY'
from rag_ingestion_factory.product.status import build_product_status
import json
print(json.dumps(build_product_status(), indent=2, ensure_ascii=False))
PY
