# LLM Wiki Compiler Layer

## Purpose

The LLM Wiki Compiler turns retrieved evidence into persistent, reviewable wiki structures.

It does not replace source documents.

It creates a structured synthesis layer above retrieval.

## Wiki Page Types

```text
topic_page
entity_page
claim_page
source_page
contradiction_page
summary_page
```

## Compiler Inputs

```text
evidence_pack
context_board
approved_claims
source_metadata
operator_notes
```

## Compiler Outputs

```text
wiki_page_id
title
page_type
summary
claims
sources
related_pages
approval_status
```

## Canonical Rule

```text
Wiki pages must cite evidence.
No evidence, no durable synthesis.
```
