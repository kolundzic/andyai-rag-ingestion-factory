from __future__ import annotations

def master_dry_run_plan(planned_versions: list[str]) -> dict:
    return {"status": "dry_run_ready", "planned_versions": planned_versions, "checks": ["repo_path", "base_tag", "shell_compatibility", "planned_files", "commit_subjects", "tag_names", "metadata_payload"]}
