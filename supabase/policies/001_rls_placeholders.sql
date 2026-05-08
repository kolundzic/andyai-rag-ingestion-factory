-- AndyAI Knowledge Factory
-- v10.3.0 RLS Placeholder Policies
-- v10.4.0 will harden these policies.

alter table public.workspaces enable row level security;
alter table public.workspace_members enable row level security;
alter table public.documents enable row level security;
alter table public.ingestion_runs enable row level security;
alter table public.chunks_metadata enable row level security;
alter table public.evidence_packs enable row level security;
alter table public.context_boards enable row level security;
alter table public.drafts enable row level security;
alter table public.approval_decisions enable row level security;
alter table public.usage_events enable row level security;
alter table public.quota_counters enable row level security;

-- Placeholder: actual auth.uid() policies arrive in v10.4.0.
