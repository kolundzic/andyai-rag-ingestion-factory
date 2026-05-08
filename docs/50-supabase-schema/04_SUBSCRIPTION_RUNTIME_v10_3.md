# Subscription Runtime v10.3.0

## Plans

```text
free
pro
team
enterprise
```

## Runtime Requirements

- plan id
- monthly limits
- workspace limits
- subscription status
- billing provider reference
- current period start/end

## Future Stripe Fields

```text
stripe_customer_id
stripe_subscription_id
stripe_price_id
```

## Canonical Rule

```text
Subscription logic must never bypass permission logic.
```
