from __future__ import annotations

from dataclasses import dataclass, field, asdict


@dataclass(frozen=True)
class WikiPage:
    wiki_page_id: str
    title: str
    page_type: str
    summary: str
    claim_ids: tuple[str, ...] = field(default_factory=tuple)
    source_refs: tuple[str, ...] = field(default_factory=tuple)
    related_pages: tuple[str, ...] = field(default_factory=tuple)
    approval_status: str = "draft"

    def to_dict(self) -> dict:
        return asdict(self)


def wiki_page_from_claim(title: str, claim_id: str, source_refs: tuple[str, ...] = ()) -> WikiPage:
    return WikiPage(
        wiki_page_id="wiki_" + str(abs(hash(title))),
        title=title,
        page_type="claim_page",
        summary=f"Evidence-backed claim page for: {title}",
        claim_ids=(claim_id,),
        source_refs=source_refs,
        approval_status="under_review",
    )
