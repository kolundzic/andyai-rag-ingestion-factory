from __future__ import annotations

EXPORT_FORMATS = ["json", "markdown", "operator_summary", "audit_snapshot", "client_report"]

def curator_export_pack(report_id: str, formats: list[str] | None = None) -> dict:
    formats = formats or ["json", "markdown", "operator_summary"]
    unsupported = [fmt for fmt in formats if fmt not in EXPORT_FORMATS]
    if unsupported:
        raise ValueError(f"Unsupported export formats: {unsupported}")
    return {"report_id": report_id, "formats": formats, "status": "ready_for_export"}
