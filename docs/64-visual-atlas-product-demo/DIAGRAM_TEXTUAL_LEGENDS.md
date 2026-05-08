# Diagram Textual Legends

## 1. Knowledge Factory Architecture

**One-line meaning:** The full architecture of AndyAI Knowledge Factory.

**What this shows:** How documents move through ingestion, retrieval, evidence, wiki synthesis, graph structure, human approval, and visual/product layers.

**Why it matters:** It proves that the system is not just RAG; it is a governed knowledge factory.

**Key elements:**
- document sources
- ingestion layer
- retrieval layer
- LLM Wiki
- Knowledge Graph
- Evidence Pack
- Human Approval
- Visual Atlas

**Process flow:**
1. Documents enter the factory.
2. Content is parsed and chunked.
3. Retrieval finds relevant fragments.
4. Evidence and synthesis layers structure the result.
5. Humans approve durable knowledge.

**Practical takeaway:** Architecture must show where trust, structure, and approval enter the system.

**AndyAI angle:** RAG finds fragments; Knowledge Factory creates governed knowledge.

---

## 2. Massive Document Ingestion Pipeline

**One-line meaning:** The large-scale PDF intake path.

**What this shows:** How 100–200 PDFs with around 1,000 pages each become clean, chunked, metadata-rich ingestion assets.

**Why it matters:** Bad ingestion creates bad retrieval; disciplined ingestion creates reliable knowledge work.

**Key elements:**
- PDF intake
- OCR / text extraction
- chunking
- metadata extraction
- document registry
- retrieval-ready storage

**Process flow:**
1. Documents enter the intake layer.
2. Text is extracted or OCR processed.
3. Content is normalized and chunked.
4. Metadata and source references are attached.
5. Chunks become retrieval-ready.

**Practical takeaway:** Retrieval quality begins before retrieval.

**AndyAI angle:** Document chaos must become an ordered evidence stream.

---

## 3. The New RAG Paradigm

**One-line meaning:** RAG is only the retrieval layer, not the whole system.

**What this shows:** The transition from classic RAG into Knowledge Factory: retrieval → evidence → wiki → graph → approval.

**Why it matters:** It positions AndyAI Knowledge Factory above commodity RAG systems.

**Key elements:**
- retrieval
- evidence pack
- LLM Wiki
- Knowledge Graph
- approval
- canonical knowledge

**Process flow:**
1. RAG retrieves fragments.
2. Evidence packs preserve source trace.
3. Wiki and graph layers structure knowledge.
4. Human approval turns proposals into durable knowledge.

**Practical takeaway:** RAG answers questions; Knowledge Factory builds reusable knowledge assets.

**AndyAI angle:** RAG is the intake machine; Knowledge Factory is the governed knowledge system.

---

## 4. Knowledge Workflows & Production Control Tower

**One-line meaning:** How knowledge work becomes controlled production work.

**What this shows:** Workflow execution, gates, production checks, deployment readiness, rollback thinking, and proof bundles.

**Why it matters:** A knowledge system must be operated, not merely demonstrated.

**Key elements:**
- workflows
- production gates
- control tower
- verification
- release proof
- rollback path

**Process flow:**
1. A workflow is started.
2. Gates check readiness.
3. Outputs are verified.
4. Evidence is bundled.
5. Production decisions are controlled.

**Practical takeaway:** Serious AI products need operational discipline.

**AndyAI angle:** The factory works only when the control tower sees the whole runway.

---

## 5. Knowledge Governance Workflow

**One-line meaning:** How claims become governed knowledge.

**What this shows:** The path from retrieved fragments to proposed claims, evidence packs, review, approval, and export.

**Why it matters:** The system must distinguish between generated proposals and approved knowledge.

**Key elements:**
- retrieved fragments
- proposed claims
- evidence pack
- review queue
- approval record
- export bundle

**Process flow:**
1. Retrieval finds supporting fragments.
2. The system proposes claims.
3. Evidence is attached.
4. A human reviews.
5. Approved outputs become reusable knowledge.

**Practical takeaway:** No approval, no trusted external output.

**AndyAI angle:** Approval state is part of meaning.

---

## 6. Knowledge Factory System Stack

**One-line meaning:** The layered technical structure of the product.

**What this shows:** How UI, runtime, data, retrieval, AI, governance, and DevOps layers fit together.

**Why it matters:** It helps builders and partners understand where each system responsibility lives.

**Key elements:**
- product surface
- API / runtime
- database
- vector search
- AI synthesis
- governance
- DevOps

**Process flow:**
1. Users interact through the product surface.
2. Runtime services coordinate work.
3. Data and retrieval layers provide context.
4. AI synthesis proposes outputs.
5. Governance controls release and reuse.

**Practical takeaway:** A professional AI product is a stack, not a prompt.

**AndyAI angle:** The stack must make trust visible.

---

## 7. Knowledge Factory System Map

**One-line meaning:** The whole system as one connected map.

**What this shows:** How all major product and knowledge layers connect into a single factory.

**Why it matters:** It gives stakeholders a complete mental model.

**Key elements:**
- documents
- ingestion
- retrieval
- wiki
- graph
- evidence
- approval
- atlas
- exports

**Process flow:**
1. Source material enters.
2. Knowledge layers process and structure it.
3. Trust layers verify it.
4. Product layers make it understandable and usable.

**Practical takeaway:** The value is in the connections between layers.

**AndyAI angle:** Knowledge becomes powerful when it becomes connected.

---

## 8. Product Surface & System Map

**One-line meaning:** How public pages connect to internal modules.

**What this shows:** The relationship between product pages, operator tools, knowledge layers, governance, and infrastructure.

**Why it matters:** It turns the repo into a product surface, not just backend code.

**Key elements:**
- home
- architecture
- playground
- docs
- pricing
- waitlist
- atlas
- control tower
- runtime stack

**Process flow:**
1. Visitors enter through public pages.
2. Operators use internal tools.
3. Backend services handle retrieval and governance.
4. Product pages explain the system.

**Practical takeaway:** Product explanation and product operation must meet.

**AndyAI angle:** A serious product shows both interface and machinery.

---

## 9. Operator Review & Approval Loop

**One-line meaning:** The human decision loop for durable knowledge.

**What this shows:** How agentic output moves into review, evidence checking, approval, rejection, revision, lock, export, and reuse.

**Why it matters:** It protects the product from unreviewed AI output.

**Key elements:**
- agentic compilation
- review queue
- human reviewer
- approve / reject / needs revision
- evidence check
- locked knowledge

**Process flow:**
1. The system proposes knowledge.
2. The item enters the review queue.
3. A human checks evidence.
4. The decision is recorded.
5. Approved knowledge can be reused.

**Practical takeaway:** Humans are not decorative; they are the governance layer.

**AndyAI angle:** Agent output is a proposal until human approval.

---

## 10. Supabase Runtime & Multi-Tenant Model

**One-line meaning:** The runtime model for users, tenants, permissions, and usage.

**What this shows:** How auth, workspaces, RLS, documents, chunks, evidence packs, subscriptions, and usage events connect.

**Why it matters:** Multi-tenant knowledge products require isolation and traceability.

**Key elements:**
- Supabase Auth
- tenants / workspaces
- RLS
- documents
- chunks
- evidence packs
- usage events
- quota counters

**Process flow:**
1. User authenticates.
2. Tenant/workspace scope is applied.
3. Runtime reads and writes governed data.
4. Usage and quotas are tracked.
5. RLS protects tenant boundaries.

**Practical takeaway:** SaaS trust begins with correct data boundaries.

**AndyAI angle:** Tenant isolation is a knowledge safety feature.

---

## 11. Vercel Deploy & Release Pipeline

**One-line meaning:** The release path from GitHub to production.

**What this shows:** GitHub, CI verify, version tags, Vercel build, preview deploy, production deploy, monitoring, and rollback.

**Why it matters:** A product must have a safe release path.

**Key elements:**
- GitHub repo
- CI verify
- tag
- preview deployment
- production deployment
- monitoring
- rollback

**Process flow:**
1. Code is committed.
2. Verification runs.
3. A version is tagged.
4. Vercel builds and previews.
5. Production deploy is gated.
6. Rollback remains available.

**Practical takeaway:** Deploy is not a button; deploy is a controlled path.

**AndyAI angle:** Check. Gate. Deploy. Verify. Prove. Rollback if needed.

---

## 12. Evidence Pack Lifecycle

**One-line meaning:** How source proof becomes reusable evidence.

**What this shows:** The lifecycle from raw source to parsed content, chunks, claims, citation anchors, review, signed/approved evidence, exports, and audit trail.

**Why it matters:** Evidence must remain traceable across the whole product.

**Key elements:**
- raw source
- parsed content
- chunk
- claim
- citation anchor
- evidence pack
- human review
- signed evidence
- audit trail

**Process flow:**
1. Source material is parsed.
2. Chunks and claims are extracted.
3. Citation anchors are created.
4. Evidence packs are assembled.
5. Humans approve.
6. Approved evidence is reused and audited.

**Practical takeaway:** Trust requires traceability.

**AndyAI angle:** No evidence, no trusted answer.

---

## 13. Permission-Aware Access Map

**One-line meaning:** Who can see, review, approve, export, and manage knowledge.

**What this shows:** Roles, resources, permissions, workspaces, approval paths, and least-privilege boundaries.

**Why it matters:** Not every user should touch every piece of knowledge.

**Key elements:**
- admin
- operator
- analyst
- viewer
- public
- documents
- graph
- evidence packs
- exports

**Process flow:**
1. A user enters with a role.
2. Workspace scope is applied.
3. Permissions filter what can be viewed or changed.
4. Approval and export actions follow stricter rules.

**Practical takeaway:** Access control is part of knowledge governance.

**AndyAI angle:** Permission-aware retrieval prevents unsafe knowledge exposure.

---

## 14. 100–200 PDFs × 1,000 Pages → Knowledge Factory

**One-line meaning:** The whole origin story in one super-poster.

**What this shows:** The full journey from massive PDFs to ingestion, retrieval, wiki, graph, atlas, workflows, evidence packs, approval, product site, and exports.

**Why it matters:** It explains the whole product in the same frame as the original problem.

**Key elements:**
- large document intake
- parsing and OCR
- chunking and metadata
- hybrid retrieval
- evidence packs
- LLM Wiki
- Knowledge Graph
- Visual Atlas
- human approval
- exports

**Process flow:**
1. Massive document collections enter.
2. The factory extracts and structures content.
3. Retrieval finds fragments.
4. Evidence proves claims.
5. Knowledge layers organize meaning.
6. Humans approve.
7. Outputs become reusable product assets.

**Practical takeaway:** The original PDF problem becomes a full knowledge infrastructure product.

**AndyAI angle:** A naive question became a sovereign Knowledge Factory.
