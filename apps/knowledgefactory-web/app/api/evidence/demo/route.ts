export async function GET() {
  return Response.json({
    evidence_policy: "No citation pack, no trusted answer.",
    citations: [
      {
        chunk_id: "demo_chunk_001",
        file_name: "demo_document.txt",
        page_start: 1,
        page_end: 1,
        section_title: "Demo"
      }
    ]
  });
}
