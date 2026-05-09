insert into release_evidence (version, base_tag, health, verify_status, tag_name, push_status, metadata_status, evidence)
values ('v45.0.0', 'v40.0.0', 'green', 'passed', 'v45.0.0', 'pushed', 'completed', '{"demo": true}'::jsonb)
on conflict do nothing;
