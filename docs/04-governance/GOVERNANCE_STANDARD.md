# Governance Standard

## Why Governance Matters

Large RAG systems can fail silently.

Bad ingestion creates confident wrong answers.

Governance prevents silent corruption.

## Required Controls

```text
file hash tracking
chunk hash tracking
embedding model versioning
index versioning
OCR quality score
parser method log
pipeline job status
error registry
human review flag
permission boundary
citation validation
```

## Failure States

```text
uploaded
parsing_failed
ocr_failed
chunking_failed
embedding_failed
indexing_failed
validation_failed
indexed
needs_review
deprecated
```

## Evidence Rule

Every answer must be traceable to the indexed source.

The system must keep evidence stronger than the generated text.
