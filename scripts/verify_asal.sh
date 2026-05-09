#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — ASAL / AndyAI Structural Awareness Layer"
echo "━━━━━━━━━━━━━━━━━━━━"

for f in \
  docs/signals/BEYOND_RAG_MCP_NATIVE_KNOWLEDGE_GRAPHS_SIGNAL.md \
  docs/asal/ANDYAI_STRUCTURAL_AWARENESS_LAYER_STANDARD.md \
  docs/asal/models/CODEBASE_STRUCTURAL_ENTITY_MODEL.md \
  docs/asal/models/STRUCTURAL_RELATION_EDGE_SCHEMA.md \
  docs/asal/pipeline/AST_PARSER_PIPELINE_CONTRACT.md \
  docs/asal/pipeline/TREE_SITTER_CANDIDATE_INTEGRATION_NOTE.md \
  docs/asal/pipeline/REPO_GRAPH_BUILD_PIPELINE.md \
  docs/asal/models/MODULE_DEPENDENCY_GRAPH_MODEL.md \
  docs/asal/models/EXECUTION_PATH_TRAVERSAL_MODEL.md \
  docs/asal/models/TEST_IMPACT_MAP_MODEL.md \
  docs/asal/mcp/MCP_GRAPH_TOOL_CONTRACT.md \
  docs/asal/mcp/GRAPH_TRAVERSAL_TOOL_REGISTRY.md \
  docs/asal/policies/HYBRID_RAG_GRAPH_ROUTING_POLICY.md \
  docs/asal/STRUCTURAL_EVIDENCE_LOG.md \
  docs/asal/models/CODEBASE_RISK_MAP.md \
  docs/asal/models/RELEASE_IMPACT_GRAPH.md \
  docs/asal/dashboard/STRUCTURAL_AWARENESS_DASHBOARD.md \
  docs/asal/ANDYAI_ASAL_KERNEL.md \
  docs/asal/ASAL_MERMAID_ARCHITECTURE.md \
  schemas/asal-node.schema.json \
  schemas/asal-edge.schema.json \
  schemas/asal-traversal.schema.json \
  schemas/asal-evidence-log.schema.json \
  examples/asal/sample-repo-graph.json \
  examples/asal/sample-traversal-result.json \
  examples/asal/sample-release-impact-graph.json \
  scripts/print_asal_status.sh \
  scripts/verify_asal.sh \
  apps/knowledgefactory-web/lib/asal.ts \
  apps/knowledgefactory-web/app/asal/page.tsx \
  apps/knowledgefactory-web/app/api/asal/status/route.ts \
  apps/knowledgefactory-web/app/asal-dashboard/page.tsx \
  apps/knowledgefactory-web/app/api/asal-dashboard/status/route.ts
do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
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
print("🟢 ASAL Python smoke tests passed")
PY

echo "🟢 VERIFY PASSED"
