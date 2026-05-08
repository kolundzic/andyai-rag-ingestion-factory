# Evidence Reranker v1.6.0

## Purpose

This release adds the evidence layer.

Retrieval candidates are not enough.

The system must package the evidence that supports an answer.

## Canonical Rule

```text
Candidate is not evidence.
Evidence is candidate + source + page + chunk + score + reason.
```

## Evidence Policy

```text
No citation pack, no trusted answer.
If evidence is weak, say evidence is weak.
```
