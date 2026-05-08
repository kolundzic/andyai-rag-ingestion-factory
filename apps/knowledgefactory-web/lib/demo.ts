export const demoEvidencePack = {
  mode: "public-playground-demo",
  query: "What does the ingestion pipeline prepare?",
  publicRule: "No citation, no trusted answer.",
  citations: [
    {
      fileName: "demo_document.txt",
      pageStart: 1,
      pageEnd: 1,
      sectionTitle: "Demo",
      chunkId: "demo_chunk_001",
      score: 0.98
    }
  ],
  answer:
    "The ingestion pipeline prepares documents for chunking, indexing, retrieval, and evidence-backed answers."
};
