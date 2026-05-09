#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Knowledge Curator + Guided Action Arc"
echo "━━━━━━━━━━━━━━━━━━━━"
for f in \
  docs/105-hermes-claude-signal-bridge/HERMES_SIGNAL_FOR_KNOWLEDGE_FACTORY.md \
  docs/105-hermes-claude-signal-bridge/KNOWLEDGE_CURATOR_STANDARD.md \
  docs/105-hermes-claude-signal-bridge/RAG_NOISE_MAP.md \
  docs/105-hermes-claude-signal-bridge/SOURCE_FRESHNESS_CHECKER.md \
  docs/105-hermes-claude-signal-bridge/DUPLICATE_DETECTOR.md \
  docs/105-hermes-claude-signal-bridge/GRAPH_HYGIENE_LAYER.md \
  docs/105-hermes-claude-signal-bridge/EVIDENCE_QUALITY_SCORE.md \
  docs/105-hermes-claude-signal-bridge/STALE_KNOWLEDGE_REPORT.md \
  docs/106-claude-work-os-signal/CLAUDE_25_WAYS_SIGNAL_ANDYAI_INTERPRETATION.md \
  docs/107-ecosystem-signal-integration/HERMES_SIGNAL_ANDYAI_ECOSYSTEM_INTEGRATION.md \
  docs/108-knowledge-curator-launch/V32_CANON_LOCK.md \
  apps/knowledgefactory-web/app/knowledge-curator/page.tsx \
  apps/knowledgefactory-web/app/knowledge-hygiene/page.tsx \
  apps/knowledgefactory-web/app/curator-command/page.tsx \
  apps/knowledgefactory-web/app/api/curator-command/status/route.ts
do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.curator import hermes_signal_status
from rag_ingestion_factory.curator.knowledge_curator import knowledge_curator_status
from rag_ingestion_factory.curator.chunk_curator import chunk_noise_map
from rag_ingestion_factory.curator.source_freshness import source_freshness_score
from rag_ingestion_factory.curator.duplicate_detector import detect_duplicate_pair
from rag_ingestion_factory.curator.graph_hygiene import graph_hygiene_report
from rag_ingestion_factory.curator.evidence_quality import evidence_quality_score
from rag_ingestion_factory.curator.stale_report import stale_knowledge_report
from rag_ingestion_factory.guided_action import claude_signal_status, guided_knowledge_action, curator_guided_action_launch_status
from rag_ingestion_factory.guided_action.ecosystem import ecosystem_signal_map

assert "Knowledge Factory cleans knowledge" in hermes_signal_status()["canon"]
assert "duplicates" in knowledge_curator_status()["checks"]
assert "missing_source" in chunk_noise_map()["noise_types"]
assert source_freshness_score(500, has_newer_version=True)["status"] == "stale"
assert detect_duplicate_pair("a", "a")["is_duplicate"]
assert "a" in graph_hygiene_report([{"id":"a"}], [])["orphan_nodes"]
assert evidence_quality_score(True, True, 1, 1, 1, True, 0)["status"] == "strong"
assert stale_knowledge_report("kb1", "old")["recommended_action"] == "review_and_refresh"
assert "Guided Action" in claude_signal_status()["andyai_translation"]
assert guided_knowledge_action("fix")["human_approval"] == "pending"
assert "Knowledge Factory" in ecosystem_signal_map()["projects"]
assert curator_guided_action_launch_status()["version"] == "v32.0.0"
print("🟢 Curator arc smoke test passed")
PY

echo "🟢 Curator arc verified"
