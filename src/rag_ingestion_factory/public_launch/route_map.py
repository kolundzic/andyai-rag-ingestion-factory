from __future__ import annotations

def public_route_map() -> dict:
    return {
        "status": "route_map_ready",
        "routes": ["/", "/public-alpha", "/public-showcase", "/public-conductor", "/visuals/atlas", "/release-proof", "/pilot-request", "/public-roadmap", "/public-architecture", "/public-signals", "/public-feedback"],
    }
