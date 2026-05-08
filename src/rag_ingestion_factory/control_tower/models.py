from __future__ import annotations

from dataclasses import dataclass, field, asdict


@dataclass(frozen=True)
class DeployReadinessCheck:
    check_id: str
    area: str
    status: str
    required: bool = True
    detail: str = ""

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class DeployGate:
    gate_id: str
    name: str
    status: str
    checks: tuple[DeployReadinessCheck, ...] = field(default_factory=tuple)

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class ProductionProofBundle:
    release_version: str
    product_site: str
    gate_results: tuple[DeployReadinessCheck, ...]
    rollback_path: str
    operator_notes: str = ""

    def to_dict(self) -> dict:
        return asdict(self)
