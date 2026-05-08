from rag_ingestion_factory.runtime.pilot_api_routes import demo_create_response, summarize_pilot_items


def test_summarize_pilot_items():
    summary = summarize_pilot_items([
        {"status": "approved_for_pilot", "priority": "high"},
        {"status": "needs_scope", "priority": "medium"},
    ])
    assert summary["total"] == 2
    assert summary["approved_for_pilot"] == 1
    assert summary["high_priority"] == 1


def test_demo_create_response():
    response = demo_create_response({"organization": "Example"})
    assert response["ok"] is True
    assert response["data"]["review_status"] == "new"
