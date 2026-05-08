from rag_ingestion_factory.distillation.clustering import cluster_near_duplicates


def test_cluster_near_duplicates():
    items = [{"id":"a","claim":"Supabase uses RLS"}, {"id":"b","claim":"Supabase RLS controls rows"}]
    assert len(cluster_near_duplicates(items, threshold=0.2)[0]) == 2
