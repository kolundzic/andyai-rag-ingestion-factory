#!/usr/bin/env bash
set -euo pipefail

export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

INPUT="${1:-examples/sample_documents/demo_document.txt}"
QUERY="${2:-What does the ingestion pipeline prepare?}"
OUT="${3:-examples/output/operator_console}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧠 AndyAI Operator Evidence Console Demo"
echo "Input: $INPUT"
echo "Query: $QUERY"
echo "Out: $OUT"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m rag_ingestion_factory.cli.main operator-demo "$INPUT" "$QUERY" --out "$OUT"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🟢 Demo complete"
echo "JSON: $OUT/operator_console_report.json"
echo "HTML: $OUT/operator_console_report.html"
echo "Bundle: $OUT/release_evidence_bundle.json"
echo "━━━━━━━━━━━━━━━━━━━━"
