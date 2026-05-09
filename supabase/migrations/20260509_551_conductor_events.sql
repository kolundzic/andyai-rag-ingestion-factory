create table if not exists conductor_events (
  id uuid primary key default gen_random_uuid(),
  project_id text not null default 'andyai-rag-ingestion-factory',
  event_type text not null,
  task_id text,
  worker_role text,
  strategy text,
  context_policy text,
  approval_status text,
  retry_status text,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists worker_results (
  id uuid primary key default gen_random_uuid(),
  task_id text not null,
  worker_role text not null,
  status text not null,
  evidence jsonb not null default '[]'::jsonb,
  failure_reason text,
  retry_suggestion text,
  created_at timestamptz not null default now()
);
