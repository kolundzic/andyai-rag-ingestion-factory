from __future__ import annotations

from .source_priority import source_priority


def canonical_merge(items: list[dict]) -> dict:
    if not items:
        return {"canonical": None, "merged_ids": []}
    canonical = sorted(items, key=source_priority, reverse=True)[0]
    return {"canonical": canonical, "merged_ids": [item["id"] for item in items if item["id"] != canonical["id"]]}
