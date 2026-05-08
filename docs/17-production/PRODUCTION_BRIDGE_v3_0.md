# Production Bridge v3.0.0

## Purpose

v3.0.0 turns AndyAI RAG Ingestion Factory from a governed architecture repo into a production-bridge repo.

The goal is not to pretend that every enterprise feature is finished.

The goal is to establish a clean bridge from local verification to real deployable infrastructure.

## v3.0.0 Adds

```text
Docker Compose stack
Qdrant service
PostgreSQL service
real Qdrant adapter implementation
config/settings layer
batch ingestion job
API foundation
operator quickstart
production bridge checklist
```

## Production Bridge Formula

```text
Local proof becomes service shape.
Service shape becomes deployment path.
Deployment path becomes production system.
```

## Canonical Rule

```text
A repo becomes serious when it can be started, inspected, verified, and extended by another engineer.
```

## What Is Production-Ready Now

- local deterministic verification
- document registration
- page-aware chunking
- local vector search
- hybrid retrieval
- evidence pack
- governance audit log
- Docker service definitions
- Qdrant adapter implementation skeleton with real client calls

## What Still Requires Real Environment

- real embedding provider
- live Qdrant service
- live PostgreSQL persistence adapter
- authentication
- tenant boundaries
- permission-aware retrieval
- production UI/dashboard

## Next Release

v3.1.0 should add a production PostgreSQL adapter and migration runner.
