from __future__ import annotations

def public_beta_route_health() -> dict:
    return {
        "status": "green",
        "routes": ["/public-beta", "/beta-feedback", "/beta-pilot-request", "/beta-admin", "/beta-trust-wall"],
    }
