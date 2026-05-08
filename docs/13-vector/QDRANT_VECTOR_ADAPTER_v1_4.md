# Qdrant Vector Index Adapter v1.4.0

## Purpose

This release adds the vector index layer for AndyAI RAG Ingestion Factory.

The design supports two modes:

```text
local deterministic vector index for tests
future Qdrant-backed production adapter
```

## Canonical Rule

```text
Qdrant is search memory.
PostgreSQL is system memory.
Original PDF is source truth.
Citation pack is evidence truth.
```

## v1.4.0 Components

- deterministic local embedding function
- in-memory vector index
- vector search result model
- Qdrant adapter contract
- optional qdrant-client dependency
- verification smoke test
