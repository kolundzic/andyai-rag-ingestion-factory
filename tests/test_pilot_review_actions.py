from rag_ingestion_factory.runtime.pilot_review_actions import validate_review_action


def test_validate_review_action_ok():
    ok, reason = validate_review_action({
        "request_id": "r1",
        "next_status": "reviewing",
        "review_owner": "operator",
        "review_notes": "Looks promising",
        "next_action": "Schedule call",
    })
    assert ok is True
    assert reason == "ok"


def test_validate_review_action_invalid_status():
    ok, reason = validate_review_action({
        "request_id": "r1",
        "next_status": "magic",
        "review_owner": "operator",
        "review_notes": "No",
        "next_action": "Stop",
    })
    assert ok is False
    assert reason == "invalid_status"
