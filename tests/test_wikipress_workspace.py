from rag_ingestion_factory.wikipress.workspace import sample_workspace, sample_project


def test_sample_workspace():
    assert sample_workspace()["plan"] == "Pro"


def test_sample_project():
    assert sample_project()["workspace_id"] == "workspace-demo"
