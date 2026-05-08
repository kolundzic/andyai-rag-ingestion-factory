from rag_ingestion_factory.config.settings import load_settings

def test_load_settings_defaults():
    settings = load_settings()
    assert settings.qdrant_url.startswith("http")
    assert settings.qdrant_collection
    assert settings.embedding_dimensions > 0
