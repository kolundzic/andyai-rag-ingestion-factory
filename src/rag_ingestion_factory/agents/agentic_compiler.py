from __future__ import annotations

from dataclasses import dataclass, field, asdict


ALLOWED_COMPILER_ACTIONS = (
    "read_evidence_pack",
    "compile_wiki_page",
    "propose_claim",
    "link_graph_nodes",
    "prepare_draft",
    "create_review_item",
    "prepare_export_bundle",
)


FORBIDDEN_COMPILER_ACTIONS = (
    "approve_own_output",
    "bypass_permissions",
    "remove_evidence",
    "externalize_unapproved_content",
    "overwrite_locked_knowledge",
)


@dataclass(frozen=True)
class AgenticCompilerTask:
    task_id: str
    task_type: str
    allowed_actions: tuple[str, ...] = field(default_factory=lambda: ALLOWED_COMPILER_ACTIONS)
    requires_human_approval: bool = True
    evidence_required: bool = True

    def to_dict(self) -> dict:
        return asdict(self)


def build_agentic_compiler_task(task_id: str, task_type: str = "compile_wiki_page") -> AgenticCompilerTask:
    return AgenticCompilerTask(task_id=task_id, task_type=task_type)
