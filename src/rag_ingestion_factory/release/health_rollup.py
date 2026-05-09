from __future__ import annotations

def release_health_rollup(statuses: list[str]) -> dict:
    if not statuses:
        return {"status": "unknown", "green": 0, "yellow": 0, "red": 0}
    green = statuses.count("green")
    yellow = statuses.count("yellow")
    red = statuses.count("red")
    status = "red" if red else "yellow" if yellow else "green"
    return {"status": status, "green": green, "yellow": yellow, "red": red}
