from rag_ingestion_factory.visual_atlas.builder import build_demo_atlas_view, build_demo_graph_explorer_session

def test_build_demo_atlas_view():
    atlas = build_demo_atlas_view()
    assert atlas.view_type == "topic_map"
    assert "claim_permissions_before_context" in atlas.visible_node_ids

def test_build_demo_graph_explorer_session():
    session = build_demo_graph_explorer_session()
    assert session.view_type == "claim_network"
