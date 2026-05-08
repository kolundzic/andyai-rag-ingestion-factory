# Evidence-First Retrieval Standard

## Purpose

Retrieval results must be treated as evidence candidates, not final knowledge.

## Every Retrieval Result Should Include

```text
document_id
source_file
page_start
page_end
chunk_id
retrieval_score
retrieval_method
permission_payload
timestamp
pipeline_version
```

## Canonical Rule

```text
A retrieved chunk is not knowledge until it is structured, linked, verified, and approved.
```
