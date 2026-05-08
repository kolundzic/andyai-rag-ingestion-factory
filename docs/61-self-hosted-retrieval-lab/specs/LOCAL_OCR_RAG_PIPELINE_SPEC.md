# Local OCR RAG Pipeline Spec

## Local Pipeline

```text
PDF / image / scan
→ OCR or text extraction
→ cleanup
→ chunking
→ embeddings
→ local vector index
→ retrieval
→ strict context answer
→ evidence pack
```

## Scale Target

```text
100–200 PDFs
~1,000 pages each
hundreds of thousands of pages
```

## Implementation Notes

The local retrieval lab should support modular replacement of:

```text
OCR engine
embedding model
vector index
reranker
LLM provider
```

## Canonical Rule

```text
At scale, retrieval must be reproducible, resumable, and evidence-aware.
```
