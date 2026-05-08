from rag_ingestion_factory.knowledgeblocks.review_queue import queue_review


def test_queue_review():
    assert queue_review({"id":"kb"})["review_status"] == "needs_review"
