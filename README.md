# AndyAI RAG Ingestion Factory

**AndyAI RAG Ingestion Factory** is a canonical, production-oriented repository for building a serious RAG ingestion pipeline for very large PDF collections.

It is designed for scenarios such as:

- 100–200 PDFs
- 1,000 pages per PDF
- 100,000–200,000 total pages
- hundreds of thousands of searchable chunks
- page-level citations
- hybrid retrieval
- human-verifiable evidence

## Canonical Principle

Raw documents are not knowledge.

They become useful only after they pass through a governed ingestion factory:

```text
PDF → Parse → Normalize → Structure → Chunk → Embed → Index → Validate → Retrieve → Cite
```

## Core Position

This repo is not a chatbot wrapper.

It is a document intelligence factory.

The goal is to build a system where every generated answer can be traced back to:

- original document
- page number
- section title
- chunk ID
- extraction method
- embedding model
- index version
- ingestion run

## Factory Layers

```text
L0 Source Vault
L1 Document Registry
L2 Parser Layer
L3 OCR Layer
L4 Structure Layer
L5 Chunking Layer
L6 Embedding Layer
L7 Hybrid Index Layer
L8 Retrieval Layer
L9 Evidence Layer
L10 Governance Layer
```

## First Release Scope

v0.1.0 establishes the repo canon, architecture, schemas, pipeline skeleton, verification script, and future roadmap.

## AndyAI Formula

```text
Document enters.
Factory structures it.
Index remembers it.
Retrieval proves it.
Human verifies it.
Answer cites it.
```
