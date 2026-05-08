from __future__ import annotations

import hashlib
import json
from typing import Any


def canonical_json(payload: dict[str, Any]) -> str:
    return json.dumps(payload, ensure_ascii=False, sort_keys=True, separators=(",", ":"))


def evidence_bundle_hash(payload: dict[str, Any]) -> str:
    return hashlib.sha256(canonical_json(payload).encode("utf-8")).hexdigest()


def attach_evidence_signature(payload: dict[str, Any]) -> dict[str, Any]:
    signed = dict(payload)
    signed["evidence_hash"] = evidence_bundle_hash(payload)
    signed["signature_mode"] = "sha256-canonical-json"
    return signed
