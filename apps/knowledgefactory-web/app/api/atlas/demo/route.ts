export async function GET() {
  return Response.json({
    atlas_id: "atlas_demo_001",
    title: "Permission-Aware Retrieval Atlas",
    view_type: "topic_map",
    root_node_id: "topic_permission_aware_retrieval",
    visible_node_ids: [
      "domain_ai_knowledge",
      "topic_permission_aware_retrieval",
      "claim_permissions_before_context",
      "source_live_qdrant_pipeline"
    ],
    visible_edge_ids: ["edge_001", "edge_002", "edge_003"],
    canonical_rule: "Structured knowledge should be visible, not only searchable."
  });
}
