# v16.3.1 — Visual Asset Scope Cleanup

## Purpose

v16.3.1 cleans the accidental visual asset over-copy from v16.2.0.

## What Happened

The v16.2.0 script used a broad PNG copy pattern from the script directory.

When the script was executed from `~/Downloads`, it copied many unrelated PNG files from Downloads into:

```text
assets/canon-visuals/extended/
apps/knowledgefactory-web/public/canon-visuals/extended/
```

## Cleanup Rule

Only the intended canonical visuals should remain.

## Canonical Base Visuals

```text
andyai_knowledge_factory_architecture_diagram.png
massive_document_ingestion_pipeline_infographic.png
the_new_rag_paradigm_flowchart.png
knowledge_workflows_and_production_control_tower.png
the_andyai_knowledge_governance_workflow.png
andyai_knowledge_factory_system_stack.png
andyai_knowledge_factory_system_map.png
andyai_product_surface_and_system_map.png
```

## Canonical Extended Visuals

```text
human_in_the_loop_knowledge_approval_process.png
supabase_runtime_and_multi_tenant_model_overview.png
vercel_deploy_and_release_pipeline_diagram.png
evidence_pack_lifecycle_infographic_flowchart.png
permission_aware_access_map_for_andyai.png
knowledge_factory_platform_architecture_diagram.png
```

## Permanent Lesson

```text
Never copy *.png from Downloads.
Always copy an explicit allowlist.
```

## Canonical Rule

```text
Visual assets must be curated, not swept.
```
