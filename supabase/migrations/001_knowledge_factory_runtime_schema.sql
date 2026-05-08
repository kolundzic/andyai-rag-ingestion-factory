-- AndyAI Knowledge Factory
-- v10.3.0 Supabase Runtime Schema
-- Product site: knowledgefactory.andyai.ai

create extension if not exists "uuid-ossp";

create table if not exists public.profiles (
  user_id uuid primary key,
  display_name text,
  email text,
  created_at timestamptz not null default now()
);

create table if not exists public.workspaces (
  workspace_id uuid primary key default uuid_generate_v4(),
  name text not null,
  owner_user_id uuid not null,
  plan_id text not null default 'free',
  created_at timestamptz not null default now()
);

create table if not exists public.workspace_members (
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  user_id uuid not null,
  role text not null check (role in ('owner', 'admin', 'editor', 'viewer')),
  created_at timestamptz not null default now(),
  primary key (workspace_id, user_id)
);

create table if not exists public.documents (
  document_id uuid primary key default uuid_generate_v4(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  file_name text not null,
  file_hash text not null,
  source_uri text,
  status text not null default 'registered',
  page_count integer not null default 0,
  created_by uuid,
  created_at timestamptz not null default now()
);

create table if not exists public.ingestion_runs (
  run_id uuid primary key default uuid_generate_v4(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  document_id uuid references public.documents(document_id) on delete cascade,
  status text not null default 'queued',
  parser_name text,
  chunker_name text,
  pages_count integer not null default 0,
  chunks_count integer not null default 0,
  error_message text,
  started_at timestamptz,
  finished_at timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists public.chunks_metadata (
  chunk_id text primary key,
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  document_id uuid not null references public.documents(document_id) on delete cascade,
  file_name text not null,
  page_start integer not null,
  page_end integer not null,
  section_title text,
  text_hash text,
  classification text not null default 'internal',
  allowed_roles text[] not null default '{}',
  allowed_users uuid[] not null default '{}',
  created_at timestamptz not null default now()
);

create table if not exists public.evidence_packs (
  evidence_pack_id uuid primary key default uuid_generate_v4(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  query text not null,
  citations jsonb not null default '[]'::jsonb,
  answer_context text,
  evidence_hash text,
  created_by uuid,
  created_at timestamptz not null default now()
);

create table if not exists public.context_boards (
  board_id uuid primary key default uuid_generate_v4(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  evidence_pack_id uuid references public.evidence_packs(evidence_pack_id) on delete set null,
  query text not null,
  status text not null default 'draft' check (status in ('draft', 'under_review', 'approved', 'rejected', 'archived')),
  evidence_items jsonb not null default '[]'::jsonb,
  operator_notes text,
  created_by uuid,
  created_at timestamptz not null default now()
);

create table if not exists public.drafts (
  draft_id uuid primary key default uuid_generate_v4(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  board_id uuid references public.context_boards(board_id) on delete set null,
  title text not null,
  markdown text not null,
  status text not null default 'draft',
  created_by uuid,
  created_at timestamptz not null default now()
);

create table if not exists public.approval_decisions (
  decision_id uuid primary key default uuid_generate_v4(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  subject_type text not null,
  subject_id text not null,
  status text not null check (status in ('pending', 'approved', 'rejected', 'needs_revision')),
  reviewer_user_id uuid,
  reason text,
  created_at timestamptz not null default now()
);

create table if not exists public.subscription_plans (
  plan_id text primary key,
  name text not null,
  monthly_query_limit integer not null,
  monthly_page_limit integer not null,
  max_workspaces integer not null,
  max_members integer not null,
  created_at timestamptz not null default now()
);

create table if not exists public.subscriptions (
  subscription_id uuid primary key default uuid_generate_v4(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  plan_id text not null references public.subscription_plans(plan_id),
  status text not null default 'active',
  billing_provider text,
  provider_customer_id text,
  provider_subscription_id text,
  current_period_start timestamptz,
  current_period_end timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists public.usage_events (
  usage_event_id uuid primary key default uuid_generate_v4(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  event_type text not null,
  units integer not null default 1,
  metadata jsonb not null default '{}'::jsonb,
  created_by uuid,
  created_at timestamptz not null default now()
);

create table if not exists public.quota_counters (
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  period_key text not null,
  metric text not null,
  used integer not null default 0,
  updated_at timestamptz not null default now(),
  primary key (workspace_id, period_key, metric)
);

create index if not exists idx_workspace_members_user_id on public.workspace_members(user_id);
create index if not exists idx_documents_workspace_id on public.documents(workspace_id);
create index if not exists idx_ingestion_runs_workspace_id on public.ingestion_runs(workspace_id);
create index if not exists idx_chunks_metadata_workspace_id on public.chunks_metadata(workspace_id);
create index if not exists idx_evidence_packs_workspace_id on public.evidence_packs(workspace_id);
create index if not exists idx_context_boards_workspace_id on public.context_boards(workspace_id);
create index if not exists idx_usage_events_workspace_id on public.usage_events(workspace_id);
