# Phase 3 — Flower Shop: Marts & Business Rules

This phase builds on Phase 2 by introducing a **marts layer** that applies business rules, joins data across domains, and exposes clean, consumption-ready tables for analytics and BI tools.

## What this phase covers

- **Seeds** — same raw CSV data loaded into the `raw` schema
- **Staging models** — same typed and cleaned views from Phase 2 in the `staging` schema
- **Mart models** — three tables in the `marts` schema that apply business logic and expose the data

## Marts

All mart models are materialized as **tables** in the `marts` schema.

### `orders`
Enriched order fact. Joins `stg_orders` with `stg_customers` and `stg_flowers` to produce a single denormalized row per order, including:
- Customer name, email, and city
- Flower name, category, and color
- `order_total_cents` and `order_total_dollars` (quantity × unit price)
- `is_delivered` flag

### `customers`
Customer 360. Combines `stg_customers` with aggregated metrics from `orders`:
- `total_orders`, `total_items_ordered`
- `total_spend_cents`, `total_spend_dollars`
- `delivered_orders`
- `first_order_at`, `last_order_at`

Customers with no orders still appear with zeroed metrics (`coalesce` on all aggregates).

### `flower_performance`
Per-flower sales performance. Aggregates `orders` by flower to show:
- `total_orders`, `total_units_sold`
- `total_revenue_cents`, `total_revenue_dollars`

Flowers with no orders still appear with zeroed metrics.

## Model lineage

```
raw.customers ──► stg_customers ──┐
                                  ├──► orders ──► customers
raw.flowers   ──► stg_flowers   ──┤            └──► flower_performance
                                  │
raw.orders    ──► stg_orders    ──┘
```

## Getting started

### Prerequisites

- Docker (for the PostgreSQL database)
- [dbt-postgres](https://docs.getdbt.com/docs/core/connect-data-platform/postgres-setup) installed

### Run the project

```bash
# Start the database
docker compose up -d

# Install dbt dependencies
dbt deps

# Load seed data
dbt seed

# Build all models (staging + marts)
dbt run

# Run all tests
dbt test
```

## Project structure

```
phase-3/
├── seeds/
│   ├── customers.csv
│   ├── flowers.csv
│   └── orders.csv
├── models/
│   ├── sources.yml
│   ├── staging/
│   │   ├── stg_customers.sql
│   │   ├── stg_flowers.sql
│   │   ├── stg_orders.sql
│   │   └── stg_flower_shop.yml
│   └── marts/
│       ├── orders.sql
│       ├── customers.sql
│       ├── flower_performance.sql
│       └── flower_shop_marts.yml
├── dbt_project.yml
├── packages.yml
└── profiles.yml
```
