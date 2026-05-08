# Permission-Aware Retrieval v4.1.0

## Purpose

Permission-aware retrieval ensures that retrieved chunks match the user's allowed scope.

A RAG system must not retrieve what the user is not allowed to see.

## Access Model

Each chunk can carry metadata such as:

```text
tenant_id
classification
allowed_roles
allowed_users
source_system
permission_source
```

## Permission Context

A user/session provides:

```text
user_id
roles
tenant_id
clearance_level
```

## Retrieval Rule

```text
No permission match, no retrieval.
```

## Design

The v4.1 implementation includes:

- access policy dataclasses
- chunk permission filtering
- retrieval candidate permission filtering
- schema for future external policy engines

## Future Upgrade

v4.2 should add Qdrant payload filters so unauthorized chunks are filtered before vector search results are returned.

## Canonical Warning

Permission filtering after generation is too late.

Permissions must be applied before context reaches the model.
