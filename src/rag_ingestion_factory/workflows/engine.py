from __future__ import annotations

from rag_ingestion_factory.workflows.models import ExportBundle, ReviewItem, WorkflowRun, WorkflowStep


def build_wiki_compile_workflow(evidence_pack_id: str) -> WorkflowRun:
    return WorkflowRun(
        workflow_run_id="wf_wiki_compile_demo",
        workflow_type="wiki_compile",
        status="waiting_for_review",
        steps=(
            WorkflowStep("step_compile", "compile", "running", (evidence_pack_id,), False),
            WorkflowStep("step_review", "review", "waiting_for_review", (evidence_pack_id,), True),
            WorkflowStep("step_approve", "approve", "queued", (evidence_pack_id,), True),
        ),
    )


def create_review_item_for_workflow(workflow: WorkflowRun, subject_type: str, subject_id: str) -> ReviewItem:
    refs: tuple[str, ...] = ()
    if workflow.steps:
        refs = workflow.steps[0].evidence_refs
    return ReviewItem(
        review_item_id=f"review_{workflow.workflow_run_id}",
        workflow_run_id=workflow.workflow_run_id,
        subject_type=subject_type,
        subject_id=subject_id,
        proposed_action="approve_compiled_knowledge",
        evidence_refs=refs,
        status="pending",
    )


def create_export_bundle(review_item: ReviewItem, export_target: str = "markdown") -> ExportBundle:
    return ExportBundle(
        export_bundle_id=f"export_{review_item.review_item_id}",
        export_target=export_target,
        approval_status="pending",
        evidence_refs=review_item.evidence_refs,
        source_refs=(review_item.subject_id,),
    )
