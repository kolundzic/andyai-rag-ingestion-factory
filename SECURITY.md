# Security Policy

## Scope

This repository deals with document ingestion, metadata, and retrieval infrastructure.

Potential risks include:

- leaking private PDFs
- storing sensitive extracted text
- mixing user permissions
- returning uncited or incorrect answers
- exposing ingestion logs
- indexing documents into the wrong tenant space

## Security Principles

```text
Original files must remain controlled.
Metadata must be traceable.
Chunks must preserve source identity.
Retrieval must respect permissions.
Answers must cite evidence.
```

## Reporting Issues

For now, please open a GitHub issue for non-sensitive security discussions.

For sensitive issues, contact the repository owner directly.

## Canonical Rule

```text
No permission boundary, no production RAG.
```
