from __future__ import annotations


def reduction_ratio(before: int, after: int) -> float:
    if after == 0:
        return 0.0
    return before / after
