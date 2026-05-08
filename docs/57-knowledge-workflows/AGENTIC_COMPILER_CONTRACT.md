# Agentic Compiler Contract

## Purpose

The Agentic Compiler defines what an AI agent may do inside Knowledge Factory.

## Allowed Actions

```text
read_evidence_pack
compile_wiki_page
propose_claim
link_graph_nodes
prepare_draft
create_review_item
prepare_export_bundle
```

## Forbidden Actions

```text
approve_own_output
bypass_permissions
remove_evidence
externalize_unapproved_content
overwrite_locked_knowledge
```

## Canonical Rule

```text
Agent output is proposal until human approval.
```
