from rag_ingestion_factory.core.models import ChunkRecord
from rag_ingestion_factory.indexes.deterministic_embeddings import embed_text
from rag_ingestion_factory.indexes.memory_vector_index import MemoryVectorIndex
from rag_ingestion_factory.retrieval.hybrid import HybridRetriever

def test_hybrid_retriever_returns_candidates():
    chunk = ChunkRecord("chk_1", "doc_1", "demo.txt", 1, 1, "Demo", 0, "The ingestion pipeline prepares chunks and indexes.", "hash", "now")
    idx = MemoryVectorIndex()
    idx.upsert_chunk(chunk, embed_text(chunk.text))
    results = HybridRetriever([chunk], idx).search("ingestion pipeline prepares", limit=3)
    assert results
    assert results[0].chunk_id == "chk_1"
