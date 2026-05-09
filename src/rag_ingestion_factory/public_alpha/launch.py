from __future__ import annotations

def launch_announcement_pack() -> dict:
    return {
        "status": "launch_pack_ready",
        "headline": "AndyAI Knowledge Factory public alpha is open.",
        "sections": ["problem", "solution", "demo", "trust", "pilot_request", "feedback"],
    }

def public_alpha_operator_script() -> dict:
    return {
        "status": "operator_script_ready",
        "steps": ["check_routes", "open_public_alpha", "open_showcase", "open_conductor", "open_release_proof", "test_cta", "capture_feedback"],
    }
