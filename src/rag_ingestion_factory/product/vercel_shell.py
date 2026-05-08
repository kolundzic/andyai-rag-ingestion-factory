from __future__ import annotations


def build_vercel_shell_status() -> dict:
    return {
        "product": "AndyAI Knowledge Factory",
        "site": "knowledgefactory.andyai.ai",
        "version": "10.2.0",
        "app_path": "apps/knowledgefactory-web",
        "framework": "Next.js",
        "pages": [
            "/",
            "/how-it-works",
            "/architecture",
            "/playground",
            "/operator-console",
            "/context-board",
            "/pricing",
            "/waitlist",
            "/docs",
        ],
    }
