from __future__ import annotations


def page_payload(title: str, markdown: str) -> dict:
    return {"title": title, "markdown": markdown}
