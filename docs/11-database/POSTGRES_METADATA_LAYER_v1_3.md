# PostgreSQL Metadata Layer v1.3.0

## Purpose

This pack adds the canonical metadata database design for AndyAI RAG Ingestion Factory.

The goal is to separate:

```text
raw files
extracted chunks
pipeline runs
retrieval indexes
evidence/citations
```

A serious RAG system needs more than a vector database.

It needs a metadata authority.

## Why PostgreSQL?

PostgreSQL is the canonical system of record for:

- documents
- ingestion runs
- chunks
- index versions
- parser versions
- pipeline status
- citation metadata
- audit fields

The vector database can store semantic vectors.

PostgreSQL stores the operational truth.

## Core Tables

```text
documents
ingestion_runs
chunks
citation_events
index_versions
```

## Canonical Rule

```text
Vector DB is search memory.
PostgreSQL is system memory.
Original file is source truth.
Citation pack is evidence truth.
```

## MVP Implementation

v1.3.0 adds:

- SQL migration
- database schema documentation
- in-memory metadata repository interface
- models for metadata persistence
- verify checks
- roadmap for future psycopg/SQLAlchemy adapter

## Next Step

v1.4.0 should add a Qdrant vector index adapter.

v1.5.0 should connect PostgreSQL metadata records to Qdrant point IDs.
