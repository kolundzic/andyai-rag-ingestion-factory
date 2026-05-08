# Qdrant Payload Permission Filters v4.2.0

## Purpose

v4.2.0 moves permission awareness closer to vector retrieval.

The goal is to prepare Qdrant payload filters so unauthorized chunks can be filtered before results become model context.

## Canonical Rule

```text
Permission filtering after generation is too late.
Permissions must shape retrieval before context reaches the model.
```

## Payload Fields

```text
tenant_id
classification
allowed_roles
allowed_users
source_system
permission_source
document_id
chunk_id
page_start
page_end
```

## Filter Logic

A user/session context becomes a Qdrant-style filter payload:

```text
tenant_id must match
clearance must be sufficient
role or user must match when policy is restrictive
```

## Production Direction

v4.2 introduces Qdrant-compatible filter payload builders without requiring a live Qdrant instance in verify.

v4.3+ can persist Context Boards that remember which permission-filtered evidence was used.
