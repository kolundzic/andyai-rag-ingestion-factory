# PDF Parser Adapter v1.2.0

## Purpose

This pack adds the first real PDF parser adapter to AndyAI RAG Ingestion Factory.

The adapter is designed with graceful fallback:

```text
If PyMuPDF is installed → real PDF page extraction
If PyMuPDF is missing → clear controlled error
If input is .txt → existing text parser remains supported
```

## Why PyMuPDF First?

PyMuPDF is a practical first adapter for born-digital PDFs because it can extract page-level text reliably and quickly.

This does not replace future OCR or layout-aware parsing.

It establishes the first PDF bridge.

## Adapter Contract

Every parser adapter must return:

```text
list[PageBlock]
```

Each PageBlock contains:

```text
document_id
file_name
page_number
text
section_title
```

## Current Capability

v1.2.0 supports:

- `.txt` local demo ingestion
- `.pdf` ingestion when PyMuPDF is installed
- page-level extraction
- page-level chunking
- manifest output
- citation output

## Install Optional PDF Support

```bash
python3 -m pip install pymupdf
```

## Run PDF Ingestion

```bash
andyai-rag ingest path/to/document.pdf --out examples/output/pdf_run
```

or without installing the CLI:

```bash
PYTHONPATH=src python3 -m rag_ingestion_factory.cli.main ingest path/to/document.pdf --out examples/output/pdf_run
```

## Canonical Rule

The parser is not the truth.

The parser is the first controlled extraction layer.

Truth still requires:

```text
source file
page number
chunk metadata
retrieval evidence
human verification
```
