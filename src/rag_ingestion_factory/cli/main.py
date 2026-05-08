from __future__ import annotations

import argparse
import json
import sys

from rag_ingestion_factory.adapters.pdf_parser import PdfParserDependencyError
from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="andyai-rag",
        description="AndyAI RAG Ingestion Factory CLI",
    )
    sub = parser.add_subparsers(dest="command", required=True)

    ingest = sub.add_parser("ingest", help="Run local ingestion pipeline")
    ingest.add_argument("input", help="Input .txt or .pdf file")
    ingest.add_argument("--out", default="examples/output", help="Output directory")

    return parser


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

    parser.error(f"Unknown command: {args.command}")


if __name__ == "__main__":
    main()
