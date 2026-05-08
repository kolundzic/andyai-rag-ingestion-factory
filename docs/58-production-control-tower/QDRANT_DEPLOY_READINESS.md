# Qdrant Deploy Readiness

## Purpose

Qdrant powers the vector retrieval layer.

## Required Checks

```text
collection naming standard
payload permission fields
embedding provider selected
upsert path defined
query path defined
evidence pack output path
```

## Canonical Rule

```text
Permissions shape vector retrieval before context reaches the model.
```
