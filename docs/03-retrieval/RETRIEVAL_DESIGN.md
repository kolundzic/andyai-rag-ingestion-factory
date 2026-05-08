# Retrieval Design

## Retrieval Flow

```mermaid
flowchart TD
  A[User Question] --> B[Query Analyzer]
  B --> C[Metadata Filter Builder]
  B --> D[Vector Search]
  B --> E[Keyword Search]
  C --> D
  C --> E
  D --> F[Candidate Merge]
  E --> F
  F --> G[Reranker]
  G --> H[Context Builder]
  H --> I[Answer Generator]
  I --> J[Citation Pack]
```

## Why Hybrid Retrieval

Vector search finds meaning.

Keyword search finds exact terms.

Metadata filters control scope.

Reranking improves final selection.

Together they are stronger than any one method alone.

## Required Retrieval Output

Each selected chunk must include:

```text
document_id
file_name
page_start
page_end
section_title
chunk_id
score
retrieval_method
index_version
```

## Answer Policy

No citation, no final answer.

If the system cannot find enough evidence, it must say so.
