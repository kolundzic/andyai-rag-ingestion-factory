#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_strategic_visuals.sh
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Karpathy LLM Wiki Bridge"
echo "━━━━━━━━━━━━━━━━━━━━"
test -f docs/99-karpathy-llm-wiki-bridge/KARPATHY_LLM_WIKI_BRIDGE.md
test -f apps/knowledgefactory-web/app/llm-wiki-bridge/page.tsx
test -f apps/knowledgefactory-web/app/api/llm-wiki-bridge/status/route.ts
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.wiki_bridge import karpathy_bridge_status
assert karpathy_bridge_status()["version"] == "v25.2.0"
print("🟢 LLM Wiki bridge smoke test passed")
PY
echo "🟢 Karpathy LLM Wiki bridge verified"
