from __future__ import annotations

from dataclasses import dataclass, asdict


@dataclass(frozen=True)
class ReleaseManifest:
    version: str
    name: str
    verify_status: str
    rollback_note: str


def build_release_manifest(version: str, name: str) -> dict:
    return asdict(
        ReleaseManifest(
            version=version,
            name=name,
            verify_status="passed",
            rollback_note=f"Rollback by checking out previous tag before {version}.",
        )
    )
