from rag_ingestion_factory.core.models import ChunkRecord
from rag_ingestion_factory.indexes.deterministic_embeddings import embed_text
from rag_ingestion_factory.indexes.memory_vector_index import MemoryVectorIndex

def test_memory_vector_index_search():
    chunk = ChunkRecord("chk_1", "doc_1", "demo.txt", 1, 1, "Demo", 0, "The ingestion pipeline prepares chunks and indexes.", "hash", "now")
    idx = MemoryVectorIndex()
    idx.upsert_chunk(chunk, embed_text(chunk.text))
    results = idx.search("ingestion pipeline", limit=1)
    assert len(results) == 1
    assert results[0].chunk_id == "chk_1"
