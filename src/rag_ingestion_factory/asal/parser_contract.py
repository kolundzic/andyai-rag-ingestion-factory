from __future__ import annotations

def ast_parser_contract() -> dict:
    return {
        "status": "ast_parser_contract_ready",
        "inputs": ["repo_path", "language", "include_globs", "exclude_globs"],
        "outputs": ["entities", "relations", "parse_errors", "evidence"],
        "candidate_tools": ["tree-sitter", "language-native-ast", "static-analysis-adapter"],
    }
