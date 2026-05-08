from rag_ingestion_factory.evidence.signing import evidence_bundle_hash, attach_evidence_signature

def test_evidence_bundle_hash():
    payload = {"b": 2, "a": 1}
    assert evidence_bundle_hash(payload) == evidence_bundle_hash({"a": 1, "b": 2})

def test_attach_signature():
    signed = attach_evidence_signature({"x": 1})
    assert "evidence_hash" in signed
