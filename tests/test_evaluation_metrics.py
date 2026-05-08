from rag_ingestion_factory.evaluation.metrics import evaluate_evidence_pack

def test_evaluate_evidence_pack():
    result = evaluate_evidence_pack({"citations": [{"x": 1}], "answer_context": "ctx", "candidate_count": 1})
    assert result["score"] == 100
    assert result["level"] == "pass"
