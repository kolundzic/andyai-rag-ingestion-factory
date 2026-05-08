from __future__ import annotations

import json


def to_jsonl(blocks: list[dict]) -> str:
    return "\n".join(json.dumps(block, ensure_ascii=False) for block in blocks)
