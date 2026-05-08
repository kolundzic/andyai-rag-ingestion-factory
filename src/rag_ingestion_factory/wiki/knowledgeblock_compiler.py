from __future__ import annotations


def compile_topic_page(title: str, blocks: list[dict]) -> str:
    body = "\n\n".join(f"## {block.get('question','Question')}\n\n{block.get('answer','')}" for block in blocks)
    return f"# {title}\n\n{body}\n"
