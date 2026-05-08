from rag_ingestion_factory.distillation.pipeline import distill_candidate
from rag_ingestion_factory.distillation.decisions import valid_decision


def test_distill_candidate():
    c = distill_candidate("chunk-1", "A claim")
    assert c["decision"] == "needs_review"


def test_valid_decision():
    assert valid_decision("approve")
