from __future__ import annotations

def persisted_public_release_proof(version: str) -> dict:
    return {"version": version, "visibility": "public-demo", "status": "persisted_proof_ready"}
