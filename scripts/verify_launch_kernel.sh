#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_wikipress_billing.sh
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — KnowledgeFactory / WikiPress Launch Kernel"
echo "━━━━━━━━━━━━━━━━━━━━"
test -f docs/104-launch-kernel/KNOWLEDGEFACTORY_WIKIPRESS_LAUNCH_KERNEL.md
test -f docs/104-launch-kernel/V30_CANON_LOCK.md
test -f apps/knowledgefactory-web/app/launch-kernel/page.tsx
test -f apps/knowledgefactory-web/app/api/launch-kernel/status/route.ts
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.launch import launch_kernel_status
s = launch_kernel_status()
assert s["version"] == "v30.0.0"
assert "KnowledgeBlock Factory" in s["modules"]
print("🟢 Launch kernel smoke test passed")
PY
echo "🟢 Launch kernel verified"
