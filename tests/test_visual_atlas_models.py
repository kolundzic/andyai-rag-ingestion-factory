from rag_ingestion_factory.visual_atlas.models import AtlasView, GraphExplorerSession

def test_atlas_view_to_dict():
    atlas = AtlasView("a1", "Atlas", "topic_map", "topic_1")
    assert atlas.to_dict()["atlas_id"] == "a1"

def test_graph_explorer_session_to_dict():
    session = GraphExplorerSession("s1", "node_1")
    assert session.to_dict()["session_id"] == "s1"
