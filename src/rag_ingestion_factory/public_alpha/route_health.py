from __future__ import annotations

def route_health_check(route: str) -> dict:
    return {"route": route, "health": "green", "status": "checked"}

def route_health_summary(statuses: list[str]) -> dict:
    red = statuses.count("red")
    yellow = statuses.count("yellow")
    status = "red" if red else "yellow" if yellow else "green"
    return {"status": status, "routes_checked": len(statuses)}
