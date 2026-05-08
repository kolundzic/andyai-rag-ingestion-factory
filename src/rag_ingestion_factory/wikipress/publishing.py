from __future__ import annotations

STAGES = ["source_intake", "knowledgeblock_selection", "wiki_compilation", "page_review", "visibility_policy", "build_manifest", "deploy_preview", "publish", "audit_snapshot"]


def publishing_pipeline_status() -> dict:
    return {"version": "v28.0.0", "status": "publishing-pipeline-ready", "stages": STAGES}


def sample_publish_job() -> dict:
    return {"id": "publish-demo", "project_id": "project-demo", "visibility": "private", "status": "draft"}
