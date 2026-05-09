from __future__ import annotations

def git_commit_tag_capture(commit_hash: str, tag: str) -> dict:
    return {"commit_hash": commit_hash, "tag": tag, "status": "captured"}
