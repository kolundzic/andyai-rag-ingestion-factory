# 🧠 AndyAI RAG Ingestion Factory

> **Evidence-governed RAG ingestion factory for large PDF libraries, sovereign enterprise knowledge systems, and permission-aware retrieval.**

<p align="left">
  <img alt="version" src="https://img.shields.io/badge/version-v16.2.0-black">
  <img alt="status" src="https://img.shields.io/badge/status-active-success">
  <img alt="type" src="https://img.shields.io/badge/type-RAG%20Ingestion%20Factory-blue">
  <img alt="sovereign" src="https://img.shields.io/badge/sovereign-ready-purple">
  <img alt="evidence" src="https://img.shields.io/badge/evidence-first-orange">
  <img alt="permissions" src="https://img.shields.io/badge/permissions-aware-red">
  <img alt="governance" src="https://img.shields.io/badge/governance-human--verified-green">
</p>

---

## 🧭 What This Repo Is

**AndyAI RAG Ingestion Factory** is a production-oriented foundation for building reliable RAG systems over very large document libraries.

It is designed for scenarios such as:

- **100–200 PDFs**
- **1,000 pages per PDF**
- **100,000–200,000 total pages**
- **hundreds of thousands of searchable chunks**
- **page-level citations**
- **hybrid retrieval**
- **permission-aware access**
- **operator evidence reports**
- **sovereign enterprise deployment paths**

This is not a PDF chatbot.

This is a **document intelligence factory**.

---

## 🧠 Canonical Principle

Raw documents are **not knowledge**.

They become usable knowledge only after they pass through a governed factory:

```text
PDF → Register → Parse → Normalize → Structure → Chunk → Embed → Index → Retrieve → Cite → Audit
```

### Core Formula

```text
Parse carefully.
Chunk intelligently.
Index traceably.
Retrieve with permissions.
Rerank evidence.
Cite always.
Audit everything.
```

### Public Line

```text
We do not just answer.
We show why the answer deserves attention.
```

---

## 🏗️ Factory Architecture

```mermaid
flowchart LR
  A[📄 PDF / TXT Library]:::blue --> B[🧾 Document Registry]:::blue
  B --> C[📥 Parser Adapter]:::purple
  C --> D[✂️ Page-Aware Chunker]:::orange
  D --> E[🗄️ PostgreSQL Metadata]:::blue
  D --> F[📦 Qdrant / Vector Index]:::orange
  D --> G[🔎 Keyword Index]:::orange
  F --> H[🔀 Hybrid Retrieval]:::green
  G --> H
  H --> I[🔐 Permission Filter]:::red
  I --> J[📌 Evidence Pack]:::green
  J --> K[🧠 Context Board]:::purple
  K --> L[📝 Evidence-to-Draft]:::orange
  L --> M[🛡️ Governance Audit]:::red

  classDef blue fill:#DCEEFF,stroke:#2F6FDB,stroke-width:2px,color:#111;
  classDef purple fill:#EADFFF,stroke:#7B3FE4,stroke-width:2px,color:#111;
  classDef orange fill:#FFE5C2,stroke:#E68A00,stroke-width:2px,color:#111;
  classDef green fill:#DDF6E5,stroke:#1F9D55,stroke-width:2px,color:#111;
  classDef red fill:#FFD9D9,stroke:#D64545,stroke-width:2px,color:#111;
```

---

## 🚀 Current Version — v4.1.0

**Sovereign Permission & Context Board Release**

v4.1.0 adds:

- sovereign enterprise standard
- permission-aware retrieval model
- access policy schema
- Context Board layer
- Evidence-to-Draft layer
- enterprise agent blueprint
- security modules
- README full rewrite

---

## 🔐 Permission-Aware Retrieval

A serious enterprise RAG system must not retrieve what the user is not allowed to see.

```text
No permission match, no retrieval.
```

Permission context:

```text
user_id
tenant_id
roles
clearance_level
```

Chunk policy:

```text
tenant_id
classification
allowed_roles
allowed_users
source_system
permission_source
```

---

## 🧠 Context Board

The Context Board is a structured workspace for evidence.

It is not chat history.

It contains:

- query
- selected citations
- evidence items
- approval status
- operator notes
- draft outputs
- review history

Formula:

```text
Retrieval finds fragments.
Context Board organizes evidence.
Human turns evidence into judgment.
```

---

## 📝 Evidence-to-Draft

The repo can now turn evidence packs into controlled Markdown drafts.

Rule:

```text
Draft must cite evidence.
No citation, no enterprise draft.
```

---

## 🧪 Quick Commands

Verify:

```bash
./scripts/verify.sh
```

Run ingestion:

```bash
PYTHONPATH=src python3 -m rag_ingestion_factory.cli.main ingest examples/sample_documents/demo_document.txt --out examples/output/text_run
```

Run evidence demo:

```bash
PYTHONPATH=src python3 -m rag_ingestion_factory.cli.main evidence-demo examples/sample_documents/demo_document.txt "What does the ingestion pipeline prepare?"
```

Run operator console:

```bash
./scripts/run_operator_console_demo.sh
```

Run Context Board demo:

```bash
PYTHONPATH=src python3 -m rag_ingestion_factory.cli.main context-board-demo examples/sample_documents/demo_document.txt "What does the ingestion pipeline prepare?"
```

Run draft demo:

```bash
PYTHONPATH=src python3 -m rag_ingestion_factory.cli.main draft-demo examples/sample_documents/demo_document.txt "What does the ingestion pipeline prepare?"
```

Run permission demo:

```bash
PYTHONPATH=src python3 -m rag_ingestion_factory.cli.main permission-demo examples/sample_documents/demo_document.txt "What does the ingestion pipeline prepare?"
```

---

## 🐳 Production Bridge

Start local infrastructure:

```bash
docker compose up -d
```

Services:

```text
Qdrant:     http://localhost:6333
PostgreSQL: localhost:5432
```

---

## 🧱 Layer Roadmap

```text
v1.x  Core ingestion, parser, metadata
v2.0  Governed RAG ingestion architecture
v3.0  Production bridge with Docker, API, batch jobs
v4.0  Operator Evidence Console
v4.1  Sovereign permissions + Context Board
v4.2  Qdrant payload permission filters
v4.3  Context Board persistence
v4.4  Evidence-to-Draft templates
v5.0  Sovereign Enterprise RAG Factory ✅
```

---

## 📁 Repo Structure

```text
docs/
  23-sovereign/
  24-security/
  25-context-board/
  26-drafting/
  27-agents/
schemas/
src/rag_ingestion_factory/
  adapters/
  api/
  config/
  context_board/
  core/
  drafting/
  embeddings/
  evidence/
  governance/
  indexes/
  jobs/
  operator/
  retrieval/
  security/
tests/
scripts/
docker-compose.yml
```

---

## 🛡️ Governance Rules

- never lose document identity
- never lose page identity
- never lose chunk identity
- never skip manifests
- never retrieve across unauthorized permission boundaries
- never draft without citations
- never hide weak evidence
- never present generated text as verified truth

---


---

## 🔐 v4.2.0 — Qdrant Payload Permission Filters

v4.2.0 prepares permission-aware retrieval at the vector payload level.

Canonical rule:

```text
Permission filtering after generation is too late.
Permissions must shape retrieval before context reaches the model.
```



---

## 🧠 v4.3.0 — Context Board Persistence

v4.3.0 saves Context Boards as reusable evidence workspaces.

Canonical rule:

```text
If evidence shaped a decision, the board must be saved.
```



---

## 📝 v4.4.0 — Evidence-to-Draft Templates

v4.4.0 adds deterministic templates:

```text
executive_brief
technical_summary
operator_report
client_explanation
```

Canonical rule:

```text
Drafts may be polished later.
But first they must be evidence-grounded.
```



---

## 🌐 v4.5.0 — External Service Gateway

v4.5.0 defines the external gateway policy.

Canonical rule:

```text
External agents access approved evidence, not raw private memory.
```



---

## 🏛️ v5.0.0 — Sovereign Enterprise RAG Factory

v5.0.0 completes the first sovereign enterprise architecture arc.

The repo now includes:

- sovereign deployment standard
- permission-aware retrieval
- Qdrant payload permission filters
- Context Board
- Context Board persistence
- Evidence-to-Draft templates
- External Service Gateway
- Operator Evidence Console
- production bridge
- governance audit

v5 formula:

```text
Data stays inside.
Permissions shape retrieval.
Evidence becomes context.
Context becomes draft.
Draft remains cited.
Agents carry proof.
Humans approve external use.
```

Public message:

```text
This is not a chatbot.
This is a sovereign evidence-governed knowledge factory.
```



---

## 🔐 v5.1.0 — Live Qdrant Permission Demo

v5.1.0 adds a safe bridge toward live Qdrant permission filtering.

```text
PermissionContext → Qdrant filter payload → vector boundary → evidence pack
```



---

## 🗄️ v5.2.0 — PostgreSQL Runtime Adapter

v5.2.0 adds production-shaped SQL statement builders for runtime persistence.

```text
Vector DB searches.
PostgreSQL remembers.
Evidence proves.
```



---

## ✅ v5.3.0 — Approval Workflow

v5.3.0 adds human approval decisions.

```text
Agents prepare.
Humans approve.
Evidence remains attached.
```



---

## 🔏 v5.4.0 — Signed Evidence Bundle

v5.4.0 adds deterministic evidence hashing.

```text
Evidence that shaped a decision must be tamper-evident.
```



---

## 📊 v5.5.0 — Evaluation Bench

v5.5.0 adds simple evidence evaluation metrics.

```text
A RAG factory must measure retrieval, not only celebrate answers.
```



---

## ⚙️ v6.0.0 — Runtime Service

v6.0.0 defines the runtime service boundary.

```text
Library becomes service only when runtime boundaries are explicit.
```



---

## 🏢 v7.0.0 — Multi-Tenant Governance

v7.0.0 defines tenant isolation boundaries.

```text
No tenant boundary, no enterprise RAG.
```



---

## 📡 v8.0.0 — Observability Dashboard

v8.0.0 adds operator observability snapshots.

```text
If operators cannot see the factory, they cannot govern the factory.
```



---

## 🏷️ v9.0.0 — Release Factory Automation

v9.0.0 defines release manifest discipline.

```text
Release is not a tag.
Release is proof plus version plus rollback path.
```



---

## 🧠 v10.0.0 — Sovereign Knowledge OS Canon Lock

v10.0.0 locks the first complete canon.

```text
Ingest.
Structure.
Permission.
Retrieve.
Evidence.
Context.
Draft.
Approve.
Externalize.
Observe.
Release.
Govern.
```

Public message:

```text
This is not a chatbot.
This is a sovereign knowledge factory with evidence, permissions, and governance.
```



---

## 🧃 v10.1.0 — Canon Recap & Public Product Bridge

v10.1.0 locks the public product direction.

```text
Product: AndyAI Knowledge Factory
Site:    knowledgefactory.andyai.ai
Repo:    andyai-rag-ingestion-factory
```

Origin story:

```text
It started with a simple question:
How do we ingest 100–200 PDFs, each with 1,000 pages?

It became AndyAI Knowledge Factory.
```

Product formula:

```text
Recap the factory.
Explain the value.
Show the product.
Prepare the web surface.
Prepare the runtime backend.
Prepare the subscription path.
Open the road to v20.
```

Next public product arc:

```text
v10.2.0 — Vercel Product Shell
v10.3.0 — Supabase Runtime Schema
v10.4.0 — Auth + RLS Permission Model
v10.5.0 — Public RAG Playground MVP
v11.0.0 — Runtime API + Web Demo Release
```



---

## 🌐 v10.2.0 — Vercel Product Shell

v10.2.0 adds the first public web product shell for:

```text
AndyAI Knowledge Factory
knowledgefactory.andyai.ai
```

App path:

```text
apps/knowledgefactory-web
```

Pages:

```text
/
 /how-it-works
 /architecture
 /playground
 /operator-console
 /context-board
 /pricing
 /waitlist
 /docs
```

Product line:

```text
Evidence-governed RAG for serious document intelligence.
```

Deployment rule:

```text
Deploy the shell first.
Connect runtime second.
```



---

## 🗄️ v10.3.0 — Supabase Runtime Schema

v10.3.0 adds the first Supabase runtime schema for:

```text
AndyAI Knowledge Factory
knowledgefactory.andyai.ai
```

Runtime tables:

```text
profiles
workspaces
workspace_members
documents
ingestion_runs
chunks_metadata
evidence_packs
context_boards
drafts
approval_decisions
subscription_plans
subscriptions
usage_events
quota_counters
```

Canonical rule:

```text
Supabase stores product runtime truth.
The repository stores engineering canon.
```

Next:

```text
v10.4.0 — Auth + RLS Permission Model
```



---

## 🔐 v10.4.0 — Auth + RLS Permission Model

v10.4.0 hardens the Supabase permission model.

```text
auth.uid()
→ workspace_members
→ workspace_id
→ table access
```

Canonical rule:

```text
No RLS, no multi-tenant production.
```



---

## 🧪 v10.5.0 — Public RAG Playground MVP

v10.5.0 creates the first public demo surface.

```text
demo query
→ evidence pack
→ citations panel
→ public explanation
```

Rule:

```text
The playground must always show citations.
```



---

## 🌐 v11.0.0 — Runtime API + Web Demo Release

v11.0.0 adds product API endpoints:

```text
/api/health
/api/runtime/status
/api/playground/demo
/api/evidence/demo
/api/context-board/demo
/api/qdrant/demo
```

Rule:

```text
API endpoints must return evidence metadata, not only generated text.
```



---

## 📦 v12.0.0 — Live Qdrant Pipeline

v12.0.0 defines the live vector retrieval path.

```text
embedding provider
→ Qdrant collection
→ payload permissions
→ vector search
→ hybrid merge
→ evidence pack
```

Rule:

```text
Permissions shape vector retrieval before context reaches the model.
```



---

## 🧬 v13.0.0 — Knowledge Graph & LLM Wiki Compiler Layer

v13.0.0 upgrades AndyAI Knowledge Factory from retrieval-first RAG into structured knowledge compilation.

```text
RAG = Retrieval Layer
LLM Wiki = Persistent Synthesis Layer
Knowledge Graph = Relationship / Structure Layer
Evidence Pack = Trust Layer
Human Approval = Governance Layer
Visual Atlas = Human Understanding Layer
```

Canonical rule:

```text
RAG is not the factory.
RAG is the intake and retrieval machine.
The real Knowledge Factory begins when retrieved fragments become structured, linked, evidence-backed, human-approved knowledge.
```

Public product copy:

```text
AndyAI Knowledge Factory does not stop at retrieval.
It compiles documents into a persistent, structured, evidence-governed knowledge graph that humans can inspect, correct, approve, and reuse.
```

Next:

```text
v14.0.0 — Visual Atlas & Graph Explorer
```



---

## 🗺️ v14.0.0 — Visual Atlas & Graph Explorer

v14.0.0 turns structured knowledge into a visible human interface.

```text
Knowledge Graph = structure
Visual Atlas = understanding
Graph Explorer = interaction
Evidence Overlay = trust visibility
Approval Overlay = governance visibility
Contradiction Map = uncertainty visibility
```

Canonical rule:

```text
Structured knowledge should be visible, not only searchable.
```

Public product meaning:

```text
AndyAI Knowledge Factory now helps humans see domains, topics, entities, claims, evidence, and approval states as an atlas and explorer layer.
```

Next:

```text
v15.0.0 — Knowledge Workflows & Agentic Compilation
```



---

## ⚙️ v15.0.0 — Knowledge Workflows & Agentic Compilation

v15.0.0 turns visible knowledge into governed workflows.

```text
Compile
→ Review
→ Approve
→ Export
→ Reuse
```

Canonical rule:

```text
Agents may compile knowledge.
Humans approve durable knowledge.
Evidence remains attached.
```

Public product meaning:

```text
AndyAI Knowledge Factory does not only search documents.
It helps teams compile, review, approve, export, and reuse evidence-backed knowledge.
```

Next:

```text
v16.0.0 — Production Deploy Control Tower
```



---

## 🗼 v16.0.0 — Production Deploy Control Tower

v16.0.0 introduces production readiness governance for AndyAI Knowledge Factory.

```text
Check.
Gate.
Deploy.
Verify.
Prove.
Rollback if needed.
Record the release.
```

Control tower areas:

```text
Vercel readiness
Supabase readiness
Qdrant readiness
environment variables
domain checklist
security gates
deploy gates
rollback plan
production proof bundle
release runway
```

Canonical rule:

```text
No production deploy without readiness gates, rollback path, and proof bundle.
```

Next:

```text
v16.1.0 — Vercel Build Verification
```




---

## 🖼️ v16.1.0 — Canon Visual Pack Integration

v16.1.0 integrates the first canon.andyai.ai visual set directly into the repo and product shell.

```text
Knowledge Factory Architecture
Massive Document Ingestion Pipeline
The New RAG Paradigm
Knowledge Workflows & Production Control Tower
Knowledge Governance Workflow
Knowledge Factory System Stack
Knowledge Factory System Map
Product Surface & System Map
```

Canonical rule:

```text
Before production deploy, the factory must be explainable at a glance.
```

Next:

```text
v16.2.0 — Extended Canon Visual Series
```




---

## 🖼️ v16.2.0 — Extended Canon Visual Series

v16.2.0 adds the second wave of canon.andyai.ai visuals focused on the most important product layers.

```text
Operator Review & Approval Loop
Supabase Runtime & Multi-Tenant Model
Vercel Deploy & Release Pipeline
Evidence Pack Lifecycle
Permission-Aware Access Map
100-200 PDFs x 1,000 Pages -> Knowledge Factory
```

Canonical rule:

```text
Every important product layer should be visually explainable.
```

Next:

```text
v16.3.0 — Visual Atlas Product Demo Layer
```


## 👨‍💻 Founder

# 🧠 AndyAI

## Canonical AI platform, system direction, and brand layer

👨‍💻 **Founder**  
Andrija (Andy) Kolundzic

🏢 **Japan IT Business**  
CEO and Owner

📍 **Tokyo, Japan**
