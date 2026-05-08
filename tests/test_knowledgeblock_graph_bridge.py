from rag_ingestion_factory.graph.graph_bridge import graph_from_blocks


def test_graph_from_blocks():
    graph = graph_from_blocks([{"id":"kb","source_document_id":"doc"}])
    assert graph["nodes"][0]["id"] == "kb"
    assert graph["edges"][0]["to"] == "doc"
