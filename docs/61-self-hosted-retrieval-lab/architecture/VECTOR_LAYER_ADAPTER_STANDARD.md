# Vector Layer Adapter Standard

## Purpose

AndyAI Knowledge Factory must remain vendor-neutral and backend-neutral.

## Adapter Candidates

```text
TurboVec
Qdrant
pgvector
FAISS
LanceDB
SQLite vector extensions
managed vector services
```

## Required Adapter Interface

```text
upsert_chunks
query_similar
filter_by_permission_payload
return_scored_matches
return_source_metadata
return_chunk_ids
```

## Canonical Rule

```text
Vector databases are replaceable engines.
Evidence governance is the durable product layer.
```
