from __future__ import annotations

def public_release_proof(version: str) -> dict:
    return {"version": version, "visibility": "public-demo", "status": "proof_ready"}
