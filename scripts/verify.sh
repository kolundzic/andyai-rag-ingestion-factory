#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v13.0.0 — Knowledge Graph & LLM Wiki Compiler"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.knowledge_graph.status import build_v13_knowledge_graph_status
from rag_ingestion_factory.knowledge_graph.compiler import build_claim_node_from_evidence_pack, link_topic_to_claim
from rag_ingestion_factory.llm_wiki.page import wiki_page_from_claim

status = build_v13_knowledge_graph_status()
assert status["formula"]["RAG"] == "Retrieval Layer"
assert status["site"] == "knowledgefactory.andyai.ai"

pack = {"citations": [{"chunk_id": "chunk_1"}], "evidence_pack_id": "ev1"}
node, claim = build_claim_node_from_evidence_pack(pack, "RAG is the retrieval layer.")
edge = link_topic_to_claim("topic_rag", node.node_id, tuple(claim.source_refs))
page = wiki_page_from_claim("RAG as Retrieval Layer", claim.claim_id, tuple(claim.source_refs))

assert node.node_type == "claim"
assert edge.edge_type == "supports"
assert page.page_type == "claim_page"
assert page.source_refs

print("🟢 v13 status verified")
print("🟢 claim node compiler verified")
print("🟢 LLM wiki page compiler verified")
PY

test -f docs/55-knowledge-graph/V13_KNOWLEDGE_GRAPH_FOUNDATION.md
test -f docs/55-knowledge-graph/LLM_WIKI_COMPILER_LAYER.md
test -f docs/55-knowledge-graph/HIERARCHICAL_KNOWLEDGE_GRAPH_STANDARD.md
test -f docs/55-knowledge-graph/KNOWLEDGE_NODE_SCHEMA.md
test -f docs/55-knowledge-graph/KNOWLEDGE_EDGE_SCHEMA.md
test -f docs/55-knowledge-graph/CLAIM_EVIDENCE_MODEL.md
test -f docs/55-knowledge-graph/GRAPH_EVIDENCE_GOVERNANCE.md
test -f docs/55-knowledge-graph/KARPATHY_LLM_WIKI_INSPIRATION_NOTE.md
test -f docs/55-knowledge-graph/UNDERSTAND_ANYTHING_SIGNAL_ANALYSIS.md
test -f docs/55-knowledge-graph/VISUAL_ATLAS_LAYER.md
test -f schemas/knowledge-node.schema.json
test -f schemas/knowledge-edge.schema.json
test -f schemas/claim.schema.json
test -f schemas/source-evidence.schema.json
test -f schemas/wiki-page.schema.json
test -f examples/knowledge-graph/sample-graph.json
test -f examples/llm-wiki/sample-topic-page.md
test -f examples/evidence-pack/sample-claim-evidence-pack.json
test -f scripts/print_v13_knowledge_graph_status.sh
test -f scripts/generate_v13_sample_graph.sh

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
