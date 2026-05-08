from rag_ingestion_factory.benchmarks.knowledgeblock_benchmark import benchmark_run


def test_benchmark_run():
    assert benchmark_run(100, 25)["corpus_reduction_ratio"] == 4.0
