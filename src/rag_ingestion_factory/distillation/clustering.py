from __future__ import annotations

from .similarity import token_similarity


def cluster_near_duplicates(items: list[dict], threshold: float = 0.5) -> list[list[str]]:
    clusters: list[list[str]] = []
    used: set[str] = set()
    for item in items:
        item_id = item["id"]
        if item_id in used:
            continue
        cluster = [item_id]
        used.add(item_id)
        for other in items:
            other_id = other["id"]
            if other_id in used:
                continue
            if token_similarity(item.get("claim", ""), other.get("claim", "")) >= threshold:
                cluster.append(other_id)
                used.add(other_id)
        clusters.append(cluster)
    return clusters
