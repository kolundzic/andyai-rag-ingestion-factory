from __future__ import annotations

def protected_admin_review_model() -> dict:
    return {
        "status": "protected_admin_model_ready",
        "guards": ["server_only_service_role", "operator_session_required", "read_only_demo_fallback"],
        "queues": ["public_interest", "pilot_intake"],
    }
