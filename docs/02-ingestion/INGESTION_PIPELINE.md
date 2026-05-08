# Ingestion Pipeline

## Simple Definition

An ingestion pipeline is the factory process that converts raw files into clean, structured, searchable, and citable knowledge blocks.

```text
Raw PDF → Parsed text → Clean elements → Structured chunks → Embeddings → Indexes → Validated retrieval
```

## Pipeline Stages

### 1. Register Document

Store document metadata:

```text
document_id
file_name
file_hash
storage_path
page_count
language
source
status
created_at
updated_at
```

### 2. Classify PDF

Detect:

```text
text PDF
scanned PDF
mixed PDF
table-heavy PDF
image-heavy PDF
multilingual PDF
legal/technical/manual-style PDF
```

### 3. Extract Content

Extract:

```text
text
headings
page numbers
tables
figure captions
footnotes
appendices
layout blocks
```

### 4. Normalize Text

Clean:

```text
broken line endings
headers and footers
duplicated page numbers
OCR noise
encoding errors
hyphenation
spacing problems
```

### 5. Preserve Structure

Keep:

```text
document title
chapter
section
subsection
page
paragraph
table
figure
appendix
```

### 6. Chunk

Create chunks that preserve meaning and evidence.

Recommended starting point:

```text
chunk size: 600–1,000 tokens
overlap: 80–150 tokens
table chunks: separate
summary chunks: separate
page citations: mandatory
```

### 7. Embed

Generate embeddings in batches and cache by chunk hash.

### 8. Index

Write to:

```text
vector database
full-text index
metadata database
object storage
```

### 9. Validate

Check:

```text
document indexed
pages covered
chunks created
vectors created
keyword index updated
sample retrieval works
citations resolve
```

## Golden Rule

Do not treat ingestion as a one-time import.

Treat it as a repeatable production pipeline.
