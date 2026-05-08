from rag_ingestion_factory.workflows.models import WorkflowStep, WorkflowRun, ReviewItem, ExportBundle

def test_workflow_models_to_dict():
    step = WorkflowStep("s1", "compile", "running", ("ev1",), False)
    run = WorkflowRun("wf1", "wiki_compile", "running", (step,))
    review = ReviewItem("r1", "wf1", "wiki_page", "wiki1", "approve", ("ev1",))
    export = ExportBundle("e1", "markdown", "pending", ("ev1",), ("wiki1",))

    assert run.to_dict()["workflow_run_id"] == "wf1"
    assert review.to_dict()["status"] == "pending"
    assert export.to_dict()["export_target"] == "markdown"
