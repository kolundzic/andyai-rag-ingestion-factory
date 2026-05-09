from __future__ import annotations

def feedback_post_route_contract() -> dict:
    return {
        "route": "/api/beta-feedback/submit",
        "method": "POST",
        "target_table": "public_interest",
        "required_fields": ["message"],
        "optional_fields": ["name", "email"],
        "status": "route_contract_ready",
    }

def pilot_request_post_route_contract() -> dict:
    return {
        "route": "/api/beta-pilot-request/submit",
        "method": "POST",
        "target_table": "pilot_intake",
        "required_fields": ["company", "use_case"],
        "optional_fields": ["contact", "priority"],
        "status": "route_contract_ready",
    }
