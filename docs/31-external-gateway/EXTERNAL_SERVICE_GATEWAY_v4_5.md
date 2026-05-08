# External Service Gateway v4.5.0

## Purpose

v4.5.0 defines the External Service Gateway policy layer.

External agents should not access raw private documents directly.

They should access approved evidence packs.

## Canonical Rule

```text
External agents access approved evidence, not raw private memory.
```

## Gateway Decision

The gateway checks:

- externalization allowed
- citations present
- citation count within limit
- sensitive/raw data not exposed
- human approval mode

## Future Implementation

v4.6+ can add signed evidence bundles and approval workflows.
