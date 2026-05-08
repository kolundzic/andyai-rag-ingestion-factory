from dataclasses import dataclass
from pathlib import Path
import hashlib


@dataclass(frozen=True)
class RegisteredDocument:
    document_id: str
    file_name: str
    file_hash: str
    path: str
    status: str


def file_sha256(path: str) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for block in iter(lambda: f.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()


def register_document(path: str) -> RegisteredDocument:
    p = Path(path)
    digest = file_sha256(str(p))
    return RegisteredDocument(
        document_id=f"doc_{digest[:16]}",
        file_name=p.name,
        file_hash=digest,
        path=str(p),
        status="registered",
    )


def classify_document(path: str) -> dict:
    p = Path(path)
    return {
        "file_name": p.name,
        "extension": p.suffix.lower(),
        "classification": "pdf_candidate" if p.suffix.lower() == ".pdf" else "unsupported",
    }


def run_ingestion_stub(path: str) -> dict:
    doc = register_document(path)
    classification = classify_document(path)
    return {
        "document": doc.__dict__,
        "classification": classification,
        "next_stage": "parse_pdf",
    }
