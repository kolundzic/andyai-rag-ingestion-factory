# Operator Quickstart v3.0.0

## 1. Verify Repo

```bash
./scripts/verify.sh
```

## 2. Start Infrastructure

```bash
docker compose up -d
```

## 3. Install Optional Production Dependencies

```bash
python3 -m pip install -e ".[qdrant,api]"
```

## 4. Run Local Ingestion

```bash
PYTHONPATH=src python3 -m rag_ingestion_factory.cli.main ingest examples/sample_documents/demo_document.txt --out examples/output/text_run
```

## 5. Run Evidence Demo

```bash
PYTHONPATH=src python3 -m rag_ingestion_factory.cli.main evidence-demo examples/sample_documents/demo_document.txt "What does the ingestion pipeline prepare?"
```

## 6. Run API

```bash
uvicorn rag_ingestion_factory.api.app:app --reload
```

## Operator Rule

```text
Do not trust a deployment until verify passes locally.
```
