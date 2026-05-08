from rag_ingestion_factory.wikipress.billing import subscription_plans, plan_allows


def test_subscription_plans():
    assert "Pro" in subscription_plans()


def test_plan_allows():
    assert plan_allows("Pro", "projects", 3) is True
    assert plan_allows("Starter", "projects", 2) is False
