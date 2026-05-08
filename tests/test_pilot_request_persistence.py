from rag_ingestion_factory.runtime.pilot_request_persistence import (
    demo_pilot_request_record,
    summarize_records,
    to_payload,
)


def test_demo_pilot_request_record_payload():
    record = demo_pilot_request_record()
    payload = to_payload(record)
    assert payload["id"] == "demo-persisted-pilot-001"
    assert payload["review_status"] == "approved_for_pilot"
    assert payload["priority"] == "high"


def test_summarize_records():
    record = demo_pilot_request_record()
    summary = summarize_records([record])
    assert summary["total"] == 1
    assert summary["approved_for_pilot"] == 1
    assert summary["high_priority"] == 1
