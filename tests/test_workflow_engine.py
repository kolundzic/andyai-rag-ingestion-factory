from rag_ingestion_factory.workflows.engine import build_wiki_compile_workflow, create_review_item_for_workflow, create_export_bundle

def test_workflow_engine():
    workflow = build_wiki_compile_workflow("ev1")
    review = create_review_item_for_workflow(workflow, "wiki_page", "wiki1")
    export = create_export_bundle(review)
    assert workflow.status == "waiting_for_review"
    assert review.evidence_refs == ("ev1",)
    assert export.evidence_refs == ("ev1",)
