#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v4.5.0 — External Gateway Policy"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.gateway.policy import ExternalGatewayPolicy, can_externalize_evidence_pack

pack = {
    "citations": [{"chunk_id": "chk_1", "file_name": "demo.txt"}],
    "evidence_policy": "No citation pack, no trusted answer."
}
policy = ExternalGatewayPolicy(allow_external=True, require_citations=True, max_citations=5)
result = can_externalize_evidence_pack(pack, policy)
assert result.allowed
assert result.reason == "allowed"
print("🟢 External gateway policy smoke test passed")
PY

test -f docs/31-external-gateway/EXTERNAL_SERVICE_GATEWAY_v4_5.md
test -f src/rag_ingestion_factory/gateway/policy.py

echo "🟢 VERIFY PASSED"
