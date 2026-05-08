from __future__ import annotations


def sample_workspace() -> dict:
    return {"id": "workspace-demo", "name": "Demo Workspace", "plan": "Pro", "status": "active"}


def sample_project() -> dict:
    return {"id": "project-demo", "workspace_id": "workspace-demo", "name": "Demo Wiki Project", "publishing_mode": "private"}
