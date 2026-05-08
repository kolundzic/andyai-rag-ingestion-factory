from rag_ingestion_factory.runtime.pilot_follow_up import draft_for_status


def test_draft_for_status():
    assert "pilot review" in draft_for_status("approved_for_pilot")["subject"]
