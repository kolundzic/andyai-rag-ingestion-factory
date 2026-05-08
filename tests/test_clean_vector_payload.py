from rag_ingestion_factory.indexes.clean_vector_payload import make_clean_vector_payload
from rag_ingestion_factory.indexes.vector_surface import can_index


def test_clean_vector_payload():
    payload = make_clean_vector_payload({"id":"kb","question":"Q","answer":"A","status":"approved"})
    assert payload["id"] == "kb"


def test_can_index():
    assert can_index({"status":"approved"})
