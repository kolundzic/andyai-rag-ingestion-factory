insert into curator_tasks (task_type, status, severity, target_ref, summary)
values ('freshness_scan', 'new', 'medium', 'source-demo', 'Demo curator task for Knowledge Factory hygiene')
on conflict do nothing;
