# Production Readiness Checklist

## Ingestion

- [x] document registration
- [x] file hash identity
- [x] text parser
- [x] PDF parser adapter
- [x] page-aware chunking
- [x] manifest generation

## Metadata

- [x] PostgreSQL schema
- [x] in-memory repository interface
- [ ] production PostgreSQL adapter
- [ ] migration runner

## Indexing

- [x] deterministic local embedding
- [x] in-memory vector index
- [x] Qdrant adapter contract
- [ ] production Qdrant upsert
- [ ] production Qdrant search

## Retrieval

- [x] keyword retrieval
- [x] vector retrieval
- [x] hybrid merge
- [x] reranker
- [x] evidence pack

## Governance

- [x] audit log
- [x] citation pack policy
- [x] public security policy
- [ ] permission boundary
- [ ] tenant isolation
- [ ] dashboard
