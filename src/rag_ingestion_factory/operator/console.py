from __future__ import annotations

from pathlib import Path
from typing import Any

from rag_ingestion_factory.adapters.router import parse_document
from rag_ingestion_factory.core.chunker import chunk_page_blocks
from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file
from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.embeddings.local import LocalDeterministicEmbeddingProvider
from rag_ingestion_factory.evidence.pack import build_evidence_pack
from rag_ingestion_factory.governance.audit import GovernanceAuditLog
from rag_ingestion_factory.indexes.memory_vector_index import MemoryVectorIndex
from rag_ingestion_factory.operator.readiness import calculate_readiness_score, default_v4_readiness_checks
from rag_ingestion_factory.reports.html_report import write_html_report
from rag_ingestion_factory.reports.json_report import write_json_report
from rag_ingestion_factory.retrieval.hybrid import HybridRetriever


def run_operator_console_demo(
    input_path: str | Path,
    query: str,
    output_dir: str | Path = "examples/output/operator_console",
) -> dict[str, Any]:
    output = Path(output_dir)
    output.mkdir(parents=True, exist_ok=True)

    manifest = ingest_local_file(input_path, output / "ingestion")

    document = register_document(input_path)
    pages = parse_document(document)
    chunks = chunk_page_blocks(pages)

    embedder = LocalDeterministicEmbeddingProvider()
    vector_index = MemoryVectorIndex()
    for chunk in chunks:
        vector_index.upsert_chunk(chunk, embedder.embed(chunk.text))

    results = HybridRetriever(chunks, vector_index).search(query, limit=5)
    evidence_pack = build_evidence_pack(query, results, limit=5)

    audit = GovernanceAuditLog()
    audit.record(
        "operator_console_demo",
        "passed",
        {
            "chunks": len(chunks),
            "retrieval_results": len(results),
            "citations": len(evidence_pack.get("citations", [])),
        },
    )
    audit_summary = audit.summary()

    readiness = calculate_readiness_score(
        default_v4_readiness_checks(
            manifest=manifest,
            evidence_pack=evidence_pack,
            audit_summary=audit_summary,
        )
    )

    report = {
        "repo": "andyai-rag-ingestion-factory",
        "version": "4.0.0",
        "query": query,
        "manifest": manifest,
        "retrieval_results": [r.__dict__ for r in results],
        "evidence_pack": evidence_pack,
        "audit_summary": audit_summary,
        "readiness": readiness,
    }

    json_path = write_json_report(output / "operator_console_report.json", report)
    html_path = write_html_report(output / "operator_console_report.html", report)

    bundle = {
        "release": "v4.0.0",
        "release_name": "Operator Evidence Console Release",
        "json_report": str(json_path),
        "html_report": str(html_path),
        "readiness": readiness,
        "audit_summary": audit_summary,
        "evidence_policy": evidence_pack.get("evidence_policy"),
    }
    bundle_path = write_json_report(output / "release_evidence_bundle.json", bundle)

    report["outputs"] = {
        "json_report": str(json_path),
        "html_report": str(html_path),
        "release_evidence_bundle": str(bundle_path),
    }

    # Rewrite JSON after output paths exist.
    write_json_report(json_path, report)

    return report
