#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "v1 Candidate Smoke"
echo "━━━━━━━━━━━━━━━━━━━━"
printf '%s\n' \
  "check: /api/beta-feedback/submit" \
  "check: /api/beta-pilot-request/submit" \
  "check: /api/beta-admin/protected-status" \
  "check: /api/v1-candidate/status" \
  "check: /api/v1-proof/status"
echo "🟢 v1 candidate smoke checklist printed"
