-- v17.0.1 — Supabase Pilot Request Persistence Rescue
-- AndyAI Knowledge Factory

create table if not exists public.pilot_requests (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  tenant_id text not null default 'demo-tenant',
  workspace_id text not null default 'demo-workspace',

  name text not null,
  email text not null,
  organization text not null,
  document_count_range text not null,
  document_type text,
  primary_domain text not null,
  main_problem text not null,
  success_criteria text not null,
  privacy_level text not null,
  pilot_timeline text,
  notes text,

  qualification_score integer not null default 0,
  qualification_status text not null default 'yellow',

  review_status text not null default 'new',
  priority text not null default 'medium',
  next_action text not null default 'assign reviewer',
  review_owner text,
  review_notes text,

  source_channel text not null default 'knowledgefactory-web',
  version text not null default 'v17.0.1'
);

create index if not exists idx_pilot_requests_tenant_workspace
  on public.pilot_requests (tenant_id, workspace_id);

create index if not exists idx_pilot_requests_review_status
  on public.pilot_requests (review_status);

create index if not exists idx_pilot_requests_priority
  on public.pilot_requests (priority);

create index if not exists idx_pilot_requests_created_at
  on public.pilot_requests (created_at desc);

alter table public.pilot_requests enable row level security;

drop policy if exists "pilot_requests_demo_select" on public.pilot_requests;
create policy "pilot_requests_demo_select"
  on public.pilot_requests
  for select
  using (true);

drop policy if exists "pilot_requests_demo_insert" on public.pilot_requests;
create policy "pilot_requests_demo_insert"
  on public.pilot_requests
  for insert
  with check (true);

-- Production note:
-- Replace demo policies with tenant-bound auth policies before production:
-- using (tenant_id = auth.jwt() ->> 'tenant_id')
-- with check (tenant_id = auth.jwt() ->> 'tenant_id')
