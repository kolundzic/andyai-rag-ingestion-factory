#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_graph_bridge.sh
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.benchmarks.knowledgeblock_benchmark import benchmark_run
assert benchmark_run(100, 25)["corpus_reduction_ratio"] == 4.0
print("🟢 Benchmark harness smoke test passed")
PY
echo "🟢 KnowledgeBlock benchmark verified"
