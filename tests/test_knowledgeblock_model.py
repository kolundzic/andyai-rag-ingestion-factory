from rag_ingestion_factory.knowledgeblocks.models import sample_knowledgeblock
from rag_ingestion_factory.knowledgeblocks.lifecycle import knowledgeblock_lifecycle


def test_sample_knowledgeblock():
    kb = sample_knowledgeblock()
    assert kb.question
    assert kb.evidence_refs
    assert kb.human_review_state == "needs_review"


def test_lifecycle():
    assert "canonical_knowledgeblock" in knowledgeblock_lifecycle()
