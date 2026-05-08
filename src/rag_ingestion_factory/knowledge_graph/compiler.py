from __future__ import annotations

from rag_ingestion_factory.knowledge_graph.models import Claim, KnowledgeEdge, KnowledgeNode


def build_claim_node_from_evidence_pack(evidence_pack: dict, claim_text: str) -> tuple[KnowledgeNode, Claim]:
    citations = evidence_pack.get("citations", [])
    source_refs = tuple(str(c.get("chunk_id", "")) for c in citations if c.get("chunk_id"))

    claim = Claim(
        claim_id="claim_" + str(abs(hash(claim_text))),
        text=claim_text,
        claim_type="evidence_supported_statement",
        confidence=0.8 if source_refs else 0.2,
        source_refs=source_refs,
        evidence_pack_id=str(evidence_pack.get("evidence_pack_id", "")),
        approval_status="supported" if source_refs else "extracted",
    )

    node = KnowledgeNode(
        node_id=claim.claim_id,
        node_type="claim",
        title=claim_text[:120],
        summary=claim_text,
        source_refs=source_refs,
        approval_status="under_review",
    )

    return node, claim


def link_topic_to_claim(topic_node_id: str, claim_node_id: str, evidence_refs: tuple[str, ...] = ()) -> KnowledgeEdge:
    return KnowledgeEdge(
        edge_id=f"edge_{topic_node_id}_{claim_node_id}",
        from_node_id=topic_node_id,
        to_node_id=claim_node_id,
        edge_type="supports",
        confidence=0.8,
        evidence_refs=evidence_refs,
    )
