from __future__ import annotations

PLANS = {
    "Starter": {"projects": 1, "knowledgeblocks": 1000, "public_sites": 0},
    "Pro": {"projects": 5, "knowledgeblocks": 10000, "public_sites": 2},
    "Studio": {"projects": 25, "knowledgeblocks": 100000, "public_sites": 10},
    "Enterprise": {"projects": -1, "knowledgeblocks": -1, "public_sites": -1},
}


def subscription_plans() -> dict:
    return PLANS


def plan_allows(plan: str, metric: str, value: int) -> bool:
    limit = PLANS.get(plan, {}).get(metric)
    if limit is None:
        return False
    if limit == -1:
        return True
    return value <= limit
