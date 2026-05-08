from __future__ import annotations

from dataclasses import dataclass, field, asdict


@dataclass(frozen=True)
class AtlasView:
    atlas_id: str
    title: str
    view_type: str
    root_node_id: str
    visible_node_ids: tuple[str, ...] = field(default_factory=tuple)
    visible_edge_ids: tuple[str, ...] = field(default_factory=tuple)
    legend: tuple[str, ...] = field(default_factory=tuple)

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class GraphExplorerSession:
    session_id: str
    selected_node_id: str
    opened_panels: tuple[str, ...] = field(default_factory=tuple)
    highlighted_edge_ids: tuple[str, ...] = field(default_factory=tuple)
    view_type: str = "topic_map"

    def to_dict(self) -> dict:
        return asdict(self)
