from __future__ import annotations

NOISE_TYPES = [
    "duplicate_chunk", "low_information_density", "broken_ocr", "missing_source",
    "stale_version", "contradiction_risk", "permission_ambiguity", "unapproved_extraction",
]

def chunk_noise_map() -> dict:
    return {"version": "v30.3.0", "noise_types": NOISE_TYPES}

def classify_chunk_noise(chunk: dict) -> list[str]:
    issues: list[str] = []
    text = str(chunk.get("text", "")).strip()
    if not text:
        issues.append("low_information_density")
    if chunk.get("source_id") in (None, ""):
        issues.append("missing_source")
    if chunk.get("ocr_quality") == "broken":
        issues.append("broken_ocr")
    if chunk.get("approved") is False:
        issues.append("unapproved_extraction")
    return issues
