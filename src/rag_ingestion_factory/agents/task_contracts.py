from __future__ import annotations

from dataclasses import dataclass, field


@dataclass(frozen=True)
class AgentTaskContract:
    task_id: str
    agent_type: str
    allowed_actions: tuple[str, ...] = field(default_factory=tuple)
    requires_human_approval: bool = True
    evidence_required: bool = True


def default_evidence_agent_contract(task_id: str) -> AgentTaskContract:
    return AgentTaskContract(
        task_id=task_id,
        agent_type="evidence_agent",
        allowed_actions=("retrieve", "rerank", "build_evidence_pack"),
        requires_human_approval=False,
        evidence_required=True,
    )
