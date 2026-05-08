from rag_ingestion_factory.visual_atlas.status import build_v14_visual_atlas_status

def test_v14_visual_atlas_status():
    status = build_v14_visual_atlas_status()
    assert status["site"] == "knowledgefactory.andyai.ai"
    assert "claim_network" in status["views"]
