from rag_ingestion_factory.strategic_visuals import strategic_visual_manifest


def test_strategic_visual_manifest():
    manifest = strategic_visual_manifest()
    assert manifest["count"] == 10
    assert "KnowledgeBlocks" in manifest["canon"]
