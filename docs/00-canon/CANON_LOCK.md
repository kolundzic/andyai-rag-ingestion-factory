# CANON LOCK — AndyAI RAG Ingestion Factory

## Locked Name

AndyAI RAG Ingestion Factory

## Locked Repo Name

andyai-rag-ingestion-factory

## Purpose

To create a production-grade ingestion and retrieval foundation for large PDF libraries.

## Problem

Most RAG systems fail because they treat documents as simple text blobs.

Large PDF libraries need:

- structured ingestion
- page-level traceability
- reliable OCR
- chunk governance
- metadata discipline
- hybrid retrieval
- reranking
- evidence logs
- repeatable indexing

## Canonical Difference

This repo does not start from prompting.

It starts from document control.

The core idea is:

```text
No reliable ingestion, no reliable RAG.
```

## Non-Negotiable Rules

1. Never lose document identity.
2. Never lose page numbers.
3. Never chunk blindly.
4. Never embed unchanged chunks twice.
5. Never rely only on vector search.
6. Never answer without citations.
7. Never hide ingestion errors.
8. Never mix permissions.
9. Never skip validation.
10. Never confuse extracted text with verified truth.

## Canonical Output

The system must always be able to produce:

```text
Answer
Source document
Page range
Section
Chunk ID
Retrieval score
Index version
Ingestion run ID
```

## Official Formula

```text
PDF is raw material.
Ingestion is the factory.
Index is the memory.
Retrieval is the search crew.
Evidence is the proof.
Human approval is the authority.
```
