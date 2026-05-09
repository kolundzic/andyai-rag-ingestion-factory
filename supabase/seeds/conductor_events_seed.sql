insert into conductor_events (event_type, task_id, worker_role, strategy, context_policy, approval_status, payload)
values ('plan_created', 'demo-task', 'retrieval_worker', 'graph_plus_source_freshness', 'limited', 'pending', '{"demo": true}'::jsonb)
on conflict do nothing;
