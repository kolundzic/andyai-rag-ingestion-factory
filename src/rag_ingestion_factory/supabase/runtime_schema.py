from __future__ import annotations


RUNTIME_TABLES = [
    "profiles",
    "workspaces",
    "workspace_members",
    "documents",
    "ingestion_runs",
    "chunks_metadata",
    "evidence_packs",
    "context_boards",
    "drafts",
    "approval_decisions",
    "subscription_plans",
    "subscriptions",
    "usage_events",
    "quota_counters",
]


def build_supabase_runtime_status() -> dict:
    return {
        "product": "AndyAI Knowledge Factory",
        "site": "knowledgefactory.andyai.ai",
        "version": "10.3.0",
        "runtime": "Supabase",
        "tables": RUNTIME_TABLES,
        "rls_next": "v10.4.0",
        "canonical_rule": "No RLS, no multi-tenant production.",
    }
