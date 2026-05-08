# Evidence-to-Draft Standard v4.1.0

## Purpose

Evidence-to-Draft converts evidence packs into structured drafts.

It does not replace human writing.

It creates a first controlled draft from evidence.

## Draft Types

```text
executive_brief
technical_summary
operator_report
client_explanation
research_note
```

## Canonical Rule

```text
Draft must cite evidence.
No citation, no enterprise draft.
```

## v4.1 Implementation

This release adds a deterministic draft builder that can turn an evidence pack into a Markdown draft with a citation section.

## Future Upgrade

v4.2+ can add templates and LLM-based refinement.

But the first draft layer must remain evidence-first.
