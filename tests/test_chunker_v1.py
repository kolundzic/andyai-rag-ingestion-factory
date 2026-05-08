from rag_ingestion_factory.core.models import PageBlock
from rag_ingestion_factory.core.chunker import chunk_page_blocks


def test_chunk_page_blocks_creates_chunk():
    pages = [
        PageBlock(
            document_id="doc_1",
            file_name="demo.txt",
            page_number=1,
            text="This is a test page.",
            section_title="Demo",
        )
    ]

    chunks = chunk_page_blocks(pages)

    assert len(chunks) == 1
    assert chunks[0].chunk_id.startswith("chk_")
    assert chunks[0].page_start == 1
    assert chunks[0].page_end == 1
