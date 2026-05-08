export async function GET() {
  return Response.json({
    product: "AndyAI Knowledge Factory",
    site: "knowledgefactory.andyai.ai",
    pipeline: "live-qdrant-ready",
    flow: [
      "embedding_provider",
      "qdrant_collection",
      "payload_permissions",
      "vector_search",
      "hybrid_merge",
      "evidence_pack"
    ],
    rule: "Permissions shape vector retrieval before context reaches the model."
  });
}
