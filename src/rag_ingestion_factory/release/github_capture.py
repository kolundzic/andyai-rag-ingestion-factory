from __future__ import annotations

def github_push_metadata(branch: str, tag: str) -> dict:
    return {"branch": branch, "tag": tag, "push_status": "captured", "remote": "origin"}
