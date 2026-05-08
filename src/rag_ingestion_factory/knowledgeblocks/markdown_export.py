from __future__ import annotations


def to_markdown(block: dict) -> str:
    return f"# {block.get('question','KnowledgeBlock')}\n\n{block.get('answer','')}\n"
