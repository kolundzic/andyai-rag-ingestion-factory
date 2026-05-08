from rag_ingestion_factory.runtime.pilot_audit_trail import create_audit_event, summarize_audit_events


def test_create_audit_event():
    event = create_audit_event("p1", "op", "new", "reviewing", "started")
    assert event["action"] == "review_status_changed"
    assert event["to_status"] == "reviewing"


def test_summarize_audit_events():
    event = create_audit_event("p1", "op", "new", "reviewing", "started")
    assert summarize_audit_events([event])["status_changes"] == 1
