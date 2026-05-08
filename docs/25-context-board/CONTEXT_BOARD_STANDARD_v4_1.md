# Context Board Standard v4.1.0

## Purpose

The Context Board is a structured workspace for evidence.

It is not chat history.

It is an operator-reviewed evidence board.

## Context Board Contains

```text
board_id
query
selected citations
evidence pack
operator notes
approval status
draft outputs
review history
```

## Why It Matters

Retrieval returns fragments.

The Context Board organizes fragments into reusable judgment context.

## Canonical Formula

```text
Retrieval finds fragments.
Context Board organizes evidence.
Human turns evidence into judgment.
```

## Status Values

```text
draft
under_review
approved
rejected
archived
```

## v4.1 Implementation

This release adds:

- ContextBoard dataclass
- EvidenceItem dataclass
- board builder from evidence pack
- JSON export pattern
