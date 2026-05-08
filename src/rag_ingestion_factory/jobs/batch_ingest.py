from __future__ import annotations

from pathlib import Path
from typing import Iterable

from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file


SUPPORTED_SUFFIXES = {".txt", ".pdf"}


def iter_supported_files(input_dir: str | Path) -> Iterable[Path]:
    root = Path(input_dir).expanduser().resolve()
    for path in sorted(root.rglob("*")):
        if path.is_file() and path.suffix.lower() in SUPPORTED_SUFFIXES:
            yield path


def batch_ingest(input_dir: str | Path, output_dir: str | Path) -> list[dict]:
    output_root = Path(output_dir)
    manifests: list[dict] = []

    for path in iter_supported_files(input_dir):
        safe_name = path.stem.replace(" ", "_")
        doc_output = output_root / safe_name
        manifest = ingest_local_file(path, doc_output)
        manifests.append(manifest)

    return manifests
