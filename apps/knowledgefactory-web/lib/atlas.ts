export const demoAtlas = {
  title: "Permission-Aware Retrieval Atlas",
  viewType: "topic_map",
  rootNodeId: "topic_permission_aware_retrieval",
  nodes: [
    { id: "domain_ai_knowledge", label: "AI Knowledge Systems", type: "domain", status: "approved" },
    { id: "topic_permission_aware_retrieval", label: "Permission-Aware Retrieval", type: "topic", status: "approved" },
    { id: "claim_permissions_before_context", label: "Permissions shape retrieval before context reaches the model.", type: "claim", status: "under_review" },
    { id: "source_live_qdrant_pipeline", label: "LIVE_QDRANT_PIPELINE_v12_0.md", type: "source", status: "approved" }
  ],
  edges: [
    { id: "edge_001", from: "domain_ai_knowledge", to: "topic_permission_aware_retrieval", type: "contains" },
    { id: "edge_002", from: "topic_permission_aware_retrieval", to: "claim_permissions_before_context", type: "supports" },
    { id: "edge_003", from: "claim_permissions_before_context", to: "source_live_qdrant_pipeline", type: "cites" }
  ]
};
