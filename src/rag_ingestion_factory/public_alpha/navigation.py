from __future__ import annotations

def public_navigation_registry() -> dict:
    return {
        "status": "navigation_ready",
        "routes": ["/public-alpha", "/public-home", "/public-showcase", "/public-conductor", "/public-nav", "/route-health", "/visuals/atlas", "/release-proof", "/pilot-request", "/public-roadmap", "/public-architecture", "/public-signals", "/public-feedback", "/launch"],
    }

def cta_flow_map() -> dict:
    return {
        "status": "cta_flow_ready",
        "primary_cta": "/pilot-request",
        "secondary_cta": "/public-showcase",
        "trust_cta": "/release-proof",
        "feedback_cta": "/public-feedback",
    }
