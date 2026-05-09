from __future__ import annotations

def supabase_insert_adapter_status() -> dict:
    return {
        "status": "insert_adapter_ready",
        "pattern": "validate_payload_then_insert_with_anon_or_server_client",
        "tables": ["public_interest", "pilot_intake"],
    }
