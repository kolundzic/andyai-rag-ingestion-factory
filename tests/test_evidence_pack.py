from rag_ingestion_factory.retrieval.models import RetrievalCandidate
from rag_ingestion_factory.evidence.pack import build_evidence_pack

def test_build_evidence_pack():
    c = RetrievalCandidate("chk_1", "doc_1", "demo.txt", 1, 1, "Demo", "The ingestion pipeline prepares chunks and indexes.", 0.8, "hybrid")
    pack = build_evidence_pack("ingestion pipeline", [c])
    assert pack["citations"]
    assert pack["citations"][0]["chunk_id"] == "chk_1"
    assert "No citation pack" in pack["evidence_policy"]
