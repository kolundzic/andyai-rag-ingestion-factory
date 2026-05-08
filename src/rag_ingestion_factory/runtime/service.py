from __future__ import annotations

from rag_ingestion_factory.knowledge_os.status import build_knowledge_os_status


class RuntimeService:
    def health(self) -> dict:
        return {"status": "ok", "service": "andyai-rag-ingestion-factory"}

    def status(self) -> dict:
        return build_knowledge_os_status()
