from __future__ import annotations

def public_interest_table_model() -> dict:
    return {
        "table": "public_interest",
        "fields": ["id", "name", "email", "message", "source", "status", "created_at"],
        "rls": "insert_public_read_admin",
    }

def pilot_intake_table_model() -> dict:
    return {
        "table": "pilot_intake",
        "fields": ["id", "company", "contact", "use_case", "status", "priority", "created_at"],
        "rls": "insert_public_read_admin",
    }
