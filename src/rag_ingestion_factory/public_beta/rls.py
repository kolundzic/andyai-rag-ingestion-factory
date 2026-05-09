from __future__ import annotations

def supabase_rls_public_beta_policy() -> dict:
    return {
        "status": "rls_policy_ready",
        "public_insert": ["public_interest", "pilot_intake"],
        "admin_read": ["public_interest", "pilot_intake"],
        "public_read": [],
    }
