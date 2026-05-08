#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

python3 - <<'PY'
from rag_ingestion_factory.control_tower.proof_bundle import build_v16_production_proof_bundle
import json
print(json.dumps(build_v16_production_proof_bundle().to_dict(), indent=2, ensure_ascii=False))
PY
