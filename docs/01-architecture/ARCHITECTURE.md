# Architecture

## System Overview

```mermaid
flowchart TD
  A[PDF Library] --> B[Document Registry]
  B --> C[Ingestion Orchestrator]
  C --> D[PDF Parser]
  C --> E[OCR Worker]
  C --> F[Table Extractor]
  D --> G[Structured Elements]
  E --> G
  F --> G
  G --> H[Normalizer]
  H --> I[Structure-Aware Chunker]
  I --> J[Embedding Worker]
  J --> K[Vector Store]
  I --> L[Full-Text Index]
  I --> M[Metadata Database]
  K --> N[Hybrid Retriever]
  L --> N
  M --> N
  N --> O[Reranker]
  O --> P[Context Builder]
  P --> Q[LLM Answer]
  Q --> R[Evidence Pack]
```

## Main Components

### Source Vault

Stores original PDFs and extracted artifacts.

### Document Registry

Tracks every file by hash, source, status, version, and ingestion run.

### Ingestion Orchestrator

Runs the pipeline as repeatable jobs.

### Parser Layer

Extracts text, headings, page blocks, tables, and layout signals.

### OCR Layer

Handles scanned PDFs and low-quality pages.

### Structure Layer

Preserves hierarchy:

```text
document → chapter → section → page → element → chunk
```

### Chunking Layer

Creates stable, metadata-rich chunks.

### Index Layer

Stores vectors, keyword index, and metadata.

### Retrieval Layer

Uses hybrid search, metadata filters, reranking, and evidence packing.

### Governance Layer

Tracks errors, quality, permissions, versions, and human review.
