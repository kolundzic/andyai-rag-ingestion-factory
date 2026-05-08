from __future__ import annotations


def build_product_status() -> dict:
    return {
        "product_name": "AndyAI Knowledge Factory",
        "product_site": "knowledgefactory.andyai.ai",
        "repo": "andyai-rag-ingestion-factory",
        "version": "10.1.0",
        "positioning": "Evidence-governed RAG for serious document intelligence.",
        "public_message": "This is not a chatbot. This is a sovereign evidence-governed knowledge factory.",
        "origin": "Started from the question of how to ingest 100-200 PDFs, each with around 1,000 pages.",
        "next": [
            "Vercel Product Shell",
            "Supabase Runtime Schema",
            "Auth + RLS",
            "Public RAG Playground",
            "Subscriptions",
        ],
    }
