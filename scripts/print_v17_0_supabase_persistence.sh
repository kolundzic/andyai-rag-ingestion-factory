#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🗄️ v17.0.1 — Supabase Pilot Request Persistence Rescue"
echo "━━━━━━━━━━━━━━━━━━━━"
echo "Migration: db/supabase/migrations/017_pilot_request_persistence.sql"
echo "Seed: db/supabase/seeds/017_pilot_request_seed.sql"
echo "Route: /pilot-admin/persistence"
echo "API: /api/pilot-request/persistence-demo"
echo "Fix: PYTHONPATH=src for Python smoke tests"
