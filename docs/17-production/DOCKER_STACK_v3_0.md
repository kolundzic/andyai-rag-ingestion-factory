# Docker Stack v3.0.0

## Services

```text
qdrant
postgres
```

## Start

```bash
docker compose up -d
```

## Stop

```bash
docker compose down
```

## Qdrant

```text
http://localhost:6333
```

## PostgreSQL

```text
localhost:5432
database: andyai_rag
user: andyai
password: andyai_dev
```

## Canonical Rule

Docker is not production by itself.

Docker is the local bridge that lets engineers test production-shaped services.
