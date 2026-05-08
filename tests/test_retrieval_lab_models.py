from rag_ingestion_factory.retrieval_lab.models import RetrievalLabRun, VectorAdapterCandidate

def test_vector_adapter_candidate():
    adapter = VectorAdapterCandidate("a1", "turbovec", ("local",))
    assert adapter.to_dict()["backend"] == "turbovec"

def test_retrieval_lab_run():
    run = RetrievalLabRun("r1", "turbovec", "bge-m3")
    assert run.strict_context_policy
