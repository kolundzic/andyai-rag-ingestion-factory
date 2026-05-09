create table if not exists release_evidence (
  id uuid primary key default gen_random_uuid(),
  project_id text not null default 'andyai-rag-ingestion-factory',
  version text not null,
  base_tag text,
  health text not null default 'green',
  verify_status text not null default 'pending',
  commit_hash text,
  tag_name text,
  push_status text,
  metadata_status text,
  evidence jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists release_events (
  id uuid primary key default gen_random_uuid(),
  release_version text not null,
  event_type text not null,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists release_incidents (
  id uuid primary key default gen_random_uuid(),
  release_version text not null,
  incident_type text not null,
  functional_damage boolean not null default false,
  resolution text not null default 'forward_only',
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists release_health (
  id uuid primary key default gen_random_uuid(),
  release_version text not null,
  health text not null,
  score numeric not null default 100,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);
