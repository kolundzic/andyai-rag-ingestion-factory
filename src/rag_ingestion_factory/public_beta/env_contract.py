from __future__ import annotations

def vercel_env_contract() -> dict:
    return {
        "status": "env_contract_ready",
        "required": ["NEXT_PUBLIC_SUPABASE_URL", "NEXT_PUBLIC_SUPABASE_ANON_KEY"],
        "server_only": ["SUPABASE_SERVICE_ROLE_KEY"],
        "optional": ["NEXT_PUBLIC_SITE_URL", "NEXT_PUBLIC_PUBLIC_BETA_MODE"],
    }
