#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v17.1.0 — Supabase Client Runtime Wiring"
echo "━━━━━━━━━━━━━━━━━━━━"
./scripts/verify_supabase_client_runtime_wiring.sh
echo "🟢 VERIFY PASSED"
