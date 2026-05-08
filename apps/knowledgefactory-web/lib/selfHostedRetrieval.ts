export const selfHostedRetrievalSignal = {
  title: "Self-Hosted Retrieval Lab",
  site: "knowledgefactory.andyai.ai",
  canonicalSentence: "RAG finds fragments. Knowledge Factory turns them into proven, linked, approved knowledge.",
  adapters: ["TurboVec", "Qdrant", "pgvector", "FAISS", "LanceDB"],
  policy: "Strict Context Answering: if not supported by retrieved context, answer Not found in context.",
  flow: [
    "PDF / OCR / Documents",
    "Text Extraction",
    "Chunking",
    "Embeddings",
    "Vector Index",
    "Retrieval",
    "Evidence Pack",
    "LLM Wiki",
    "Knowledge Graph",
    "Human Approval",
    "Canonical Knowledge"
  ]
};
