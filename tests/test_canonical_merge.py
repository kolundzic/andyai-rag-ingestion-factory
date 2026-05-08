from rag_ingestion_factory.distillation.merge import canonical_merge


def test_canonical_merge():
    result = canonical_merge([{"id":"a","confidence":0.2}, {"id":"b","confidence":0.9}])
    assert result["canonical"]["id"] == "b"
