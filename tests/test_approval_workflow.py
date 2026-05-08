from rag_ingestion_factory.approval.workflow import create_approval_decision, is_approved

def test_approval_decision():
    d = create_approval_decision("ctx_1", "approved", "andy")
    assert is_approved(d)
