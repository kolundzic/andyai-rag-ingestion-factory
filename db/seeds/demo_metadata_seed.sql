-- Demo seed for documentation only.
-- Do not run in production without replacing IDs and paths.

INSERT INTO documents (
    document_id,
    file_name,
    file_hash,
    source_path,
    status
) VALUES (
    'doc_demo',
    'demo_document.txt',
    'demo_hash',
    'examples/sample_documents/demo_document.txt',
    'indexed'
) ON CONFLICT (document_id) DO NOTHING;
