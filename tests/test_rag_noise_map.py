from rag_ingestion_factory.knowledgeblocks.noise import noise_map


def test_noise_map():
    assert "duplicate_chunks" in noise_map()
