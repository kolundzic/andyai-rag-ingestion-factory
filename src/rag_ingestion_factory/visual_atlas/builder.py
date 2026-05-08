from __future__ import annotations

from rag_ingestion_factory.visual_atlas.models import AtlasView, GraphExplorerSession


def build_demo_atlas_view() -> AtlasView:
    return AtlasView(
        atlas_id="atlas_demo_001",
        title="Permission-Aware Retrieval Atlas",
        view_type="topic_map",
        root_node_id="topic_permission_aware_retrieval",
        visible_node_ids=(
            "domain_ai_knowledge",
            "topic_permission_aware_retrieval",
            "claim_permissions_before_context",
            "source_live_qdrant_pipeline",
        ),
        visible_edge_ids=("edge_001", "edge_002", "edge_003"),
        legend=("topic", "claim", "source", "supports", "cites", "approval"),
    )


def build_demo_graph_explorer_session() -> GraphExplorerSession:
    return GraphExplorerSession(
        session_id="graph_session_demo_001",
        selected_node_id="claim_permissions_before_context",
        opened_panels=("node_detail", "evidence_panel", "approval_panel"),
        highlighted_edge_ids=("edge_002", "edge_003"),
        view_type="claim_network",
    )
