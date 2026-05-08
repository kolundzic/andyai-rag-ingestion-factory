# Operations

## Worker Model

Recommended workers:

```text
register_worker
classify_worker
parse_worker
ocr_worker
table_worker
normalize_worker
chunk_worker
embed_worker
index_worker
validate_worker
```

## Queue Design

Use a queue for long-running jobs.

Recommended tools:

```text
Celery + Redis
RQ + Redis
Prefect
Temporal
```

## Storage Design

```text
Object storage: original PDFs and extracted artifacts
PostgreSQL: metadata, jobs, chunks
Qdrant: vector search
OpenSearch or PostgreSQL FTS: keyword search
```

## Idempotency

Every job must be safe to run again.

Stable identifiers:

```text
document_id = hash(file)
page_id = hash(document_id + page_number)
chunk_id = hash(document_id + page_range + chunk_text)
```
