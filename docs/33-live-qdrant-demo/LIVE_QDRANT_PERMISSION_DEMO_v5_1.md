# Live Qdrant Permission Demo v5.1.0

## Purpose

v5.1.0 adds a safe live-demo bridge for Qdrant permission filtering.

It keeps local verification dependency-free while documenting how live Qdrant payload filters should be used.

## Canonical Rule

```text
Permissions must shape vector retrieval before context reaches the model.
```

## Demo Layers

```text
PermissionContext
→ Qdrant filter payload
→ chunk payload policy
→ vector search boundary
→ evidence pack
```

## Future Live Mode

Use Docker:

```bash
docker compose up -d
```

Then install:

```bash
python3 -m pip install -e ".[qdrant]"
```
