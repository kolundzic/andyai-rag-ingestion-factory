from __future__ import annotations

def safe_commit_subject(subject: str, fallback: str = "chore: safe release update") -> str:
    cleaned = " ".join(str(subject or "").replace("\n", " ").split())
    if not cleaned:
        return fallback
    forbidden = ["${", "`", "$(", "&&", "||", ";"]
    if any(token in cleaned for token in forbidden):
        return fallback
    return cleaned[:120]
