#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v10.3.0 — Supabase Runtime Schema"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from pathlib import Path
from rag_ingestion_factory.supabase.runtime_schema import build_supabase_runtime_status, RUNTIME_TABLES

status = build_supabase_runtime_status()
assert status["site"] == "knowledgefactory.andyai.ai"
assert status["runtime"] == "Supabase"
assert "workspaces" in RUNTIME_TABLES
assert "evidence_packs" in RUNTIME_TABLES
assert "subscriptions" in RUNTIME_TABLES
print("🟢 Supabase runtime schema status verified")
print(f"🟢 Runtime tables: {len(RUNTIME_TABLES)}")
PY

test -f supabase/migrations/001_knowledge_factory_runtime_schema.sql
test -f supabase/policies/001_rls_placeholders.sql
test -f supabase/seed/001_subscription_plans.sql
test -f docs/50-supabase-schema/00_SUPABASE_RUNTIME_SCHEMA_v10_3.md
test -f docs/50-supabase-schema/02_RLS_DESIGN_v10_3.md
test -f docs/50-supabase-schema/04_SUBSCRIPTION_RUNTIME_v10_3.md
test -f docs/releases/RELEASE_NOTES_v10.3.0.md
test -f src/rag_ingestion_factory/supabase/runtime_schema.py
test -f scripts/print_v10_3_supabase_schema.sh

grep -q "create table if not exists public.workspaces" supabase/migrations/001_knowledge_factory_runtime_schema.sql
grep -q "create table if not exists public.evidence_packs" supabase/migrations/001_knowledge_factory_runtime_schema.sql
grep -q "create table if not exists public.context_boards" supabase/migrations/001_knowledge_factory_runtime_schema.sql
grep -q "create table if not exists public.subscriptions" supabase/migrations/001_knowledge_factory_runtime_schema.sql

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
