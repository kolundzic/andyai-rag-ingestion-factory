from rag_ingestion_factory.release_factory.manifest import build_release_manifest

def test_release_manifest():
    m = build_release_manifest("v9.0.0", "Release Factory")
    assert m["verify_status"] == "passed"
