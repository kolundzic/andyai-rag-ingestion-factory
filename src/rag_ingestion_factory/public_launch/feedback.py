from __future__ import annotations

def public_feedback_record(message: str, source: str = "public-demo") -> dict:
    return {"message": message, "source": source, "status": "captured"}
