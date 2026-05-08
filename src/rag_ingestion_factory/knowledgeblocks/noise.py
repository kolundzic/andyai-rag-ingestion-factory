from __future__ import annotations

FAILURE_TYPES = ["duplicate_chunks", "split_ideas", "missing_source_anchor", "stale_version_conflict", "permission_blind_retrieval"]


def noise_map() -> list[str]:
    return list(FAILURE_TYPES)
