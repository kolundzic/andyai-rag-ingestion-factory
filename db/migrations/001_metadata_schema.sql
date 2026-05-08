-- AndyAI RAG Ingestion Factory
-- v1.3.0 PostgreSQL Metadata Layer

CREATE TABLE IF NOT EXISTS documents (
    document_id TEXT PRIMARY KEY,
    file_name TEXT NOT NULL,
    file_hash TEXT NOT NULL UNIQUE,
    source_path TEXT NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS ingestion_runs (
    run_id TEXT PRIMARY KEY,
    document_id TEXT NOT NULL REFERENCES documents(document_id),
    pipeline_version TEXT NOT NULL,
    parser_name TEXT NOT NULL,
    chunker_name TEXT NOT NULL,
    pages_count INTEGER NOT NULL DEFAULT 0,
    chunks_count INTEGER NOT NULL DEFAULT 0,
    status TEXT NOT NULL,
    error_message TEXT,
    started_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    finished_at TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS chunks (
    chunk_id TEXT PRIMARY KEY,
    document_id TEXT NOT NULL REFERENCES documents(document_id),
    file_name TEXT NOT NULL,
    page_start INTEGER NOT NULL,
    page_end INTEGER NOT NULL,
    section_title TEXT,
    chunk_index INTEGER NOT NULL,
    text_hash TEXT NOT NULL,
    text TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS index_versions (
    index_version_id TEXT PRIMARY KEY,
    index_type TEXT NOT NULL,
    backend TEXT NOT NULL,
    embedding_model TEXT,
    status TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS citation_events (
    citation_event_id TEXT PRIMARY KEY,
    chunk_id TEXT NOT NULL REFERENCES chunks(chunk_id),
    document_id TEXT NOT NULL REFERENCES documents(document_id),
    file_name TEXT NOT NULL,
    page_start INTEGER NOT NULL,
    page_end INTEGER NOT NULL,
    section_title TEXT,
    retrieval_method TEXT NOT NULL,
    score DOUBLE PRECISION NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_chunks_document_id ON chunks(document_id);
CREATE INDEX IF NOT EXISTS idx_chunks_page_range ON chunks(document_id, page_start, page_end);
CREATE INDEX IF NOT EXISTS idx_ingestion_runs_document_id ON ingestion_runs(document_id);
CREATE INDEX IF NOT EXISTS idx_citation_events_chunk_id ON citation_events(chunk_id);
