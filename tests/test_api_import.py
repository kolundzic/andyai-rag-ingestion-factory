def test_api_module_imports():
    import rag_ingestion_factory.api.app as app_module
    assert hasattr(app_module, "IngestTextDemoRequest")
