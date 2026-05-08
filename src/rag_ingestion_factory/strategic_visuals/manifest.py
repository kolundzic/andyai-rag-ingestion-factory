from __future__ import annotations

STRATEGIC_VISUALS = [
    "system_overview_andyai_knowledge_architecture.png",
    "andyai_knowledge_ecosystem_diagram.png",
    "living_wiki_memory_loop_diagram.png",
    "adastranova_beyond_system_flowchart.png",
    "trust_and_governance_flow_diagram.png",
    "system_workflow_for_scheduled_memory_growth.png",
    "strategic_transformation_mapping_for_canon_visual.png",
    "product_model_overview_andyai_wikipress.png",
    "knowledgeblock_distillation_process_overview.png",
    "user_experience_flowchart_design_overview.png",
]


def strategic_visual_manifest() -> dict:
    return {
        "version": "v25.1.0",
        "count": len(STRATEGIC_VISUALS),
        "visuals": list(STRATEGIC_VISUALS),
        "canon": "Knowledge Factory produces KnowledgeBlocks; LLM Wiki compiles living pages; AdAstraNova proves; WikiPress scales.",
    }
