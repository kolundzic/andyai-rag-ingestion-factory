from rag_ingestion_factory.retrieval_lab.policies import strict_context_answer

def test_strict_context_answer_empty_context():
    response = strict_context_answer("", "anything")
    assert response["answer"] == "Not found in context."
    assert response["trusted"] is False

def test_strict_context_answer_with_context():
    response = strict_context_answer("context", "answer")
    assert response["trusted"] is True
