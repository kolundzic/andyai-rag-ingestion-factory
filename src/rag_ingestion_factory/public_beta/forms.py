from __future__ import annotations

def feedback_form_payload(name: str, message: str, email: str | None = None) -> dict:
    return {
        "name": name,
        "email": email,
        "message": message,
        "source": "public_beta_feedback",
        "status": "ready_to_submit",
    }

def pilot_request_payload(company: str, use_case: str, contact: str | None = None) -> dict:
    return {
        "company": company,
        "contact": contact,
        "use_case": use_case,
        "source": "public_beta_pilot_request",
        "status": "ready_to_submit",
    }
