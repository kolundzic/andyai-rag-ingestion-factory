from pathlib import Path
import json


def test_examples_have_required_fields():
    for path in Path("examples/knowledgeblocks").glob("*-knowledgeblock.json"):
        data = json.loads(path.read_text())
        assert data["id"]
        assert data["question"]
        assert data["answer"]
        assert data["source_document_id"]
