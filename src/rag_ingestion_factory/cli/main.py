from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

from rag_ingestion_factory.adapters.pdf_parser import PdfParserDependencyError
from rag_ingestion_factory.adapters.router import parse_document
from rag_ingestion_factory.core.chunker import chunk_page_blocks
from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file
from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.evidence.pack import build_evidence_pack
from rag_ingestion_factory.indexes.deterministic_embeddings import embed_text
from rag_ingestion_factory.indexes.memory_vector_index import MemoryVectorIndex
from rag_ingestion_factory.jobs.batch_ingest import batch_ingest
from rag_ingestion_factory.operator.console import run_operator_console_demo
from rag_ingestion_factory.retrieval.hybrid import HybridRetriever
from rag_ingestion_factory.retrieval.permission_aware import filter_candidates_by_permission
from rag_ingestion_factory.security.access_policy import AccessPolicy, PermissionContext
from rag_ingestion_factory.drafting.from_evidence import draft_markdown_from_evidence
from rag_ingestion_factory.context_board.board import context_board_from_evidence_pack, context_board_to_dict


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(prog="andyai-rag", description="AndyAI RAG Ingestion Factory CLI")
    sub = parser.add_subparsers(dest="command", required=True)

    ingest = sub.add_parser("ingest", help="Run local ingestion pipeline")
    ingest.add_argument("input", help="Input .txt or .pdf file")
    ingest.add_argument("--out", default="examples/output", help="Output directory")

    batch = sub.add_parser("batch-ingest", help="Run batch ingestion over a directory")
    batch.add_argument("input_dir", help="Input directory containing .txt or .pdf files")
    batch.add_argument("--out", default="examples/output/batch", help="Output root directory")

    search = sub.add_parser("search-demo", help="Run local hybrid retrieval demo against one file")
    search.add_argument("input", help="Input .txt or .pdf file")
    search.add_argument("query", help="Search query")
    search.add_argument("--limit", type=int, default=3)

    evidence = sub.add_parser("evidence-demo", help="Run retrieval and build an evidence pack")
    evidence.add_argument("input", help="Input .txt or .pdf file")
    evidence.add_argument("query", help="Search query")
    evidence.add_argument("--limit", type=int, default=3)

    operator = sub.add_parser("operator-demo", help="Run full operator evidence console demo")
    operator.add_argument("input", help="Input .txt or .pdf file")
    operator.add_argument("query", help="Search query")
    operator.add_argument("--out", default="examples/output/operator_console", help="Output directory")

    board = sub.add_parser("context-board-demo", help="Build a Context Board from an evidence demo")
    board.add_argument("input", help="Input .txt or .pdf file")
    board.add_argument("query", help="Search query")
    board.add_argument("--limit", type=int, default=3)

    draft = sub.add_parser("draft-demo", help="Build a Markdown draft from evidence")
    draft.add_argument("input", help="Input .txt or .pdf file")
    draft.add_argument("query", help="Search query")
    draft.add_argument("--limit", type=int, default=3)

    perm = sub.add_parser("permission-demo", help="Run permission-aware retrieval demo")
    perm.add_argument("input", help="Input .txt or .pdf file")
    perm.add_argument("query", help="Search query")
    perm.add_argument("--tenant", default="default")
    perm.add_argument("--role", default="reader")

    return parser


def _build_demo_retriever(input_path: str) -> HybridRetriever:
    document = register_document(Path(input_path))
    pages = parse_document(document)
    chunks = chunk_page_blocks(pages)

    idx = MemoryVectorIndex()
    for chunk in chunks:
        idx.upsert_chunk(chunk, embed_text(chunk.text))

    return HybridRetriever(chunks, idx)


def main() -> None:
    parser = build_parser()
    args = parser.parse_args()

    if args.command == "ingest":
        try:
            manifest = ingest_local_file(args.input, args.out)
        except PdfParserDependencyError as exc:
            print(f"🔴 {exc}", file=sys.stderr)
            raise SystemExit(2)
        print(json.dumps(manifest, ensure_ascii=False, indent=2, sort_keys=True))
        return

    if args.command == "batch-ingest":
        manifests = batch_ingest(args.input_dir, args.out)
        print(json.dumps(manifests, ensure_ascii=False, indent=2, sort_keys=True))
        return

    if args.command == "search-demo":
        results = _build_demo_retriever(args.input).search(args.query, limit=args.limit)
        print(json.dumps([r.__dict__ for r in results], ensure_ascii=False, indent=2, sort_keys=True))
        return

    if args.command == "evidence-demo":
        results = _build_demo_retriever(args.input).search(args.query, limit=args.limit)
        pack = build_evidence_pack(args.query, results, limit=args.limit)
        print(json.dumps(pack, ensure_ascii=False, indent=2, sort_keys=True))
        return

    if args.command == "operator-demo":
        report = run_operator_console_demo(args.input, args.query, args.out)
        print(json.dumps(report, ensure_ascii=False, indent=2, sort_keys=True))
        return

    if args.command == "context-board-demo":
        results = _build_demo_retriever(args.input).search(args.query, limit=args.limit)
        pack = build_evidence_pack(args.query, results, limit=args.limit)
        board = context_board_from_evidence_pack(pack)
        print(json.dumps(context_board_to_dict(board), ensure_ascii=False, indent=2, sort_keys=True))
        return

    if args.command == "draft-demo":
        results = _build_demo_retriever(args.input).search(args.query, limit=args.limit)
        pack = build_evidence_pack(args.query, results, limit=args.limit)
        print(draft_markdown_from_evidence(pack, title="AndyAI Evidence-Based Draft"))
        return

    if args.command == "permission-demo":
        results = _build_demo_retriever(args.input).search(args.query, limit=5)
        policies = {
            r.chunk_id: AccessPolicy(tenant_id=args.tenant, classification="internal", allowed_roles=(args.role,))
            for r in results
        }
        context = PermissionContext(user_id="demo-user", tenant_id=args.tenant, roles=(args.role,), clearance_level="internal")
        allowed = filter_candidates_by_permission(results, policies, context)
        print(json.dumps([r.__dict__ for r in allowed], ensure_ascii=False, indent=2, sort_keys=True))
        return

    parser.error(f"Unknown command: {args.command}")


if __name__ == "__main__":
    main()
