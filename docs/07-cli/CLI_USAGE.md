# CLI Usage

## Local Verify

```bash
cd ~/Documents/Projects/andyai-rag-ingestion-factory
./scripts/verify.sh
```

## Ingest Text Demo

```bash
PYTHONPATH=src python3 -m rag_ingestion_factory.cli.main ingest examples/sample_documents/demo_document.txt --out examples/output/text_run
```

## Install Optional PDF Parser

```bash
python3 -m pip install pymupdf
```

## Ingest PDF

```bash
PYTHONPATH=src python3 -m rag_ingestion_factory.cli.main ingest path/to/document.pdf --out examples/output/pdf_run
```

## Installed CLI Mode

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e .
pip install pymupdf
andyai-rag ingest path/to/document.pdf --out examples/output/pdf_run
```
