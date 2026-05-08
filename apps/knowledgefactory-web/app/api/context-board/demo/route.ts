export async function GET() {
  return Response.json({
    board_id: "ctx_demo_001",
    status: "draft",
    query: "What does the ingestion pipeline prepare?",
    evidence_items: [
      {
        chunk_id: "demo_chunk_001",
        file_name: "demo_document.txt",
        page_start: 1,
        page_end: 1
      }
    ]
  });
}
