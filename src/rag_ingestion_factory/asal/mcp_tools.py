from __future__ import annotations

def mcp_graph_tool_contract() -> dict:
    return {
        "status": "mcp_graph_tools_ready",
        "tools": {
            "node_lookup": {"input": "node_id_or_name", "output": "node"},
            "outgoing_edges": {"input": "node_id", "output": "edges"},
            "incoming_edges": {"input": "node_id", "output": "edges"},
            "path_find": {"input": "source,target", "output": "path"},
            "subgraph_expand": {"input": "node_id,depth", "output": "subgraph"},
        },
    }
