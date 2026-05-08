#!/usr/bin/env bash
set -euo pipefail

BASE_ALLOWLIST=(
  "andyai_knowledge_factory_architecture_diagram.png"
  "massive_document_ingestion_pipeline_infographic.png"
  "the_new_rag_paradigm_flowchart.png"
  "knowledge_workflows_and_production_control_tower.png"
  "the_andyai_knowledge_governance_workflow.png"
  "andyai_knowledge_factory_system_stack.png"
  "andyai_knowledge_factory_system_map.png"
  "andyai_product_surface_and_system_map.png"
)

EXT_ALLOWLIST=(
  "human_in_the_loop_knowledge_approval_process.png"
  "supabase_runtime_and_multi_tenant_model_overview.png"
  "vercel_deploy_and_release_pipeline_diagram.png"
  "evidence_pack_lifecycle_infographic_flowchart.png"
  "permission_aware_access_map_for_andyai.png"
  "knowledge_factory_platform_architecture_diagram.png"
)

check_dir_exact() {
  local dir="$1"
  shift
  local allowlist=("$@")

  if [ ! -d "$dir" ]; then
    echo "🔴 Missing directory: $dir"
    exit 1
  fi

  local count
  count="$(find "$dir" -maxdepth 1 -type f -name '*.png' | wc -l | tr -d ' ')"

  if [ "$count" != "${#allowlist[@]}" ]; then
    echo "🔴 Unexpected PNG count in $dir: got $count expected ${#allowlist[@]}"
    find "$dir" -maxdepth 1 -type f -name '*.png' -print | sort
    exit 1
  fi

  local file
  for file in "${allowlist[@]}"; do
    test -f "$dir/$file"
  done

  echo "🟢 $dir locked at $count visuals"
}

check_dir_exact "assets/canon-visuals" "${BASE_ALLOWLIST[@]}"
check_dir_exact "apps/knowledgefactory-web/public/canon-visuals" "${BASE_ALLOWLIST[@]}"
check_dir_exact "assets/canon-visuals/extended" "${EXT_ALLOWLIST[@]}"
check_dir_exact "apps/knowledgefactory-web/public/canon-visuals/extended" "${EXT_ALLOWLIST[@]}"
