# Contributing

Thank you for your interest in AndyAI RAG Ingestion Factory.

## Project Direction

This repository focuses on ingestion-first RAG architecture for large PDF libraries.

Priority areas:

- PDF parsing
- page-aware chunking
- metadata governance
- citation integrity
- hybrid retrieval
- vector index adapters
- evidence-backed answers

## Contribution Rules

Please keep contributions aligned with the canon:

```text
No ingestion discipline, no RAG truth.
```

## Good Contributions

- parser adapters
- chunking improvements
- metadata schema improvements
- vector database adapters
- retrieval tests
- citation validation
- documentation improvements
- examples

## Not Preferred

- chatbot UI before ingestion reliability
- prompt-only changes
- unsupported claims
- hidden failure states
- code without verification

## Development

Run:

```bash
./scripts/verify.sh
```

Optional:

```bash
python3 -m pip install pytest
PYTHONPATH=src pytest
```
