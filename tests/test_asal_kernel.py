from rag_ingestion_factory.asal.entities import structural_entity
from rag_ingestion_factory.asal.relations import structural_relation
from rag_ingestion_factory.asal.parser_contract import ast_parser_contract
from rag_ingestion_factory.asal.repo_graph import repo_graph_status, module_dependency_graph
from rag_ingestion_factory.asal.traversal import execution_path_traversal, graph_traversal_registry
from rag_ingestion_factory.asal.impact import test_impact_map, release_impact_graph, codebase_risk_map
from rag_ingestion_factory.asal.mcp_tools import mcp_graph_tool_contract
from rag_ingestion_factory.asal.routing import hybrid_rag_graph_routing_policy
from rag_ingestion_factory.asal.evidence import structural_evidence_log
from rag_ingestion_factory.asal.dashboard import structural_awareness_dashboard_status
from rag_ingestion_factory.asal.kernel import asal_kernel_status

def test_asal_kernel():
    assert structural_entity("function", "parse_docs")["type"] == "function"
    assert structural_relation("parse_docs", "build_graph", "calls")["relation"] == "calls"
    assert ast_parser_contract()["status"] == "ast_parser_contract_ready"
    assert repo_graph_status()["status"] == "repo_graph_pipeline_ready"
    assert module_dependency_graph()["status"] == "module_dependency_graph_ready"
    assert execution_path_traversal("api_handler", "database_write")["status"] == "traversal_ready"
    assert test_impact_map(["src/a.py"])["status"] == "test_impact_ready"
    assert release_impact_graph("v110.0.0")["status"] == "release_impact_ready"
    assert codebase_risk_map()["status"] == "risk_map_ready"
    assert mcp_graph_tool_contract()["status"] == "mcp_graph_tools_ready"
    assert "node_lookup" in graph_traversal_registry()["tools"]
    assert hybrid_rag_graph_routing_policy("which function calls writer?")["route"] == "graph_traversal"
    assert structural_evidence_log("traversal")["event_type"] == "traversal"
    assert structural_awareness_dashboard_status()["status"] == "dashboard_ready"
    assert asal_kernel_status()["version"] == "v110.0.0"
