from rag_ingestion_factory.quality.knowledge_quality import quality_score
from rag_ingestion_factory.quality.report import quality_report


def test_quality_score():
    score = quality_score({"evidence_refs":[{}], "status":"approved", "governance_tags":["internal"]})
    assert score == 100


def test_quality_report():
    assert quality_report([{"evidence_refs":[{}]}])["count"] == 1
