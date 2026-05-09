#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "Public Beta Env Contract"
echo "━━━━━━━━━━━━━━━━━━━━"
printf '%s\n' "NEXT_PUBLIC_SUPABASE_URL" "NEXT_PUBLIC_SUPABASE_ANON_KEY" "SUPABASE_SERVICE_ROLE_KEY (server only)"
echo "🟢 Env contract printed"
