# API Foundation v3.0.0

## Purpose

The API foundation defines the future service boundary.

v3.0.0 includes a FastAPI-compatible app skeleton.

## Endpoints

```text
GET /health
POST /ingest/text-demo
POST /retrieve/demo
```

## Why API Foundation Now?

The repo has reached the point where ingestion, retrieval, evidence, and governance need a service surface.

The API is not the final product.

It is the bridge between library and deployable service.

## Canonical API Rule

```text
API endpoints must return evidence metadata, not only generated text.
```
