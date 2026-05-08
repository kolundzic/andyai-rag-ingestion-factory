# Live Qdrant Pipeline v12.0.0

## Purpose

v12.0.0 defines the live Qdrant pipeline path for AndyAI Knowledge Factory.

## Product

```text
knowledgefactory.andyai.ai
```

## Flow

```text
embedding provider
→ Qdrant collection
→ payload permissions
→ vector search
→ hybrid merge
→ evidence pack
```

## Canonical Rule

```text
Permissions shape vector retrieval before context reaches the model.
```

## Local Infrastructure

```bash
docker compose up -d
```

## Future

v12.1 should connect real Qdrant search from the Vercel/API runtime through a secure server-side route.
