export async function GET() {
  return Response.json({
    mode: "public-playground-demo",
    query: "What does the ingestion pipeline prepare?",
    evidence_pack: {
      citations: [
        {
          chunk_id: "demo_chunk_001",
          file_name: "demo_document.txt",
          page_start: 1,
          page_end: 1,
          section_title: "Demo",
          score: 0.98
        }
      ],
      answer_context:
        "The ingestion pipeline prepares documents for chunking, indexing, retrieval, and evidence-backed answers."
    },
    public_rule: "No citation, no trusted answer."
  });
}
