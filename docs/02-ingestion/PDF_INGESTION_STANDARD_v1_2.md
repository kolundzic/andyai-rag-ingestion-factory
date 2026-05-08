# PDF Ingestion Standard v1.2.0

## Input Types

The ingestion factory now accepts:

```text
.txt
.pdf
```

## PDF Processing Rule

For every PDF page:

```text
extract page text
preserve page number
create PageBlock
send to chunker
write chunks.jsonl
write manifest.json
write keyword_index.json
write sample_citations.jsonl
```

## Page Identity Rule

Every extracted chunk must keep:

```text
file_name
document_id
page_start
page_end
chunk_id
text_hash
```

## Failure Rule

If the PDF parser dependency is missing, the system must fail clearly and instruct the operator how to install it.

No silent fallback.
No fake extraction.
No empty success.
