#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v10.2.0 — Vercel Product Shell"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.product.vercel_shell import build_vercel_shell_status

status = build_vercel_shell_status()
assert status["site"] == "knowledgefactory.andyai.ai"
assert status["app_path"] == "apps/knowledgefactory-web"
assert "/playground" in status["pages"]
print("🟢 Vercel shell status verified")
print(f"🟢 Pages: {len(status['pages'])}")
PY

test -f apps/knowledgefactory-web/package.json
test -f apps/knowledgefactory-web/app/page.tsx
test -f apps/knowledgefactory-web/app/layout.tsx
test -f apps/knowledgefactory-web/app/globals.css
test -f apps/knowledgefactory-web/components/SiteNav.tsx
test -f apps/knowledgefactory-web/components/PageShell.tsx
test -f apps/knowledgefactory-web/lib/product.ts
test -f apps/knowledgefactory-web/app/playground/page.tsx
test -f apps/knowledgefactory-web/app/operator-console/page.tsx
test -f apps/knowledgefactory-web/app/context-board/page.tsx
test -f docs/49-vercel-shell/00_VERCEL_PRODUCT_SHELL_v10_2.md
test -f docs/49-vercel-shell/02_DEPLOYMENT_GUIDE_v10_2.md
test -f docs/releases/RELEASE_NOTES_v10.2.0.md
test -f scripts/print_v10_2_vercel_shell.sh

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
