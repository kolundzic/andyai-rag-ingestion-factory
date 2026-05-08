# Context Board Persistence v4.3.0

## Purpose

v4.3.0 adds persistence for Context Boards.

The Context Board becomes a reusable evidence workspace, not a temporary object.

## Why It Matters

Enterprise work often needs evidence to be reviewed, reused, approved, rejected, and archived.

## Storage Format

v4.3 uses JSON file persistence.

Future versions can move to PostgreSQL.

## Canonical Rule

```text
If evidence shaped a decision, the board must be saved.
```
