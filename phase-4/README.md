# Phase 4 — Flower Shop: ClickHouse Port

This phase ports the Phase 3 project from PostgreSQL to **ClickHouse**, adapting SQL syntax and materialization strategy to fit ClickHouse's columnar, append-optimised engine.

## What changed from Phase 3

| Area | Phase 3 (Postgres) | Phase 4 (ClickHouse) |
|---|---|---|
| Adapter | `dbt-postgres` | `dbt-clickhouse` |
| Connection | port 54321 | port 8123 (HTTP) |
| String concat | `\|\|` operator | `concat()` function |
| Boolean cast | `cast(x as boolean)` | `x = 'true'` comparison |
| Filtered count | `count() filter (where ...)` | `countIf()` |
| Mart tables | default Postgres heap | `MergeTree()` with `order_by` |
| Seed types | inferred | explicit `column_types` in `dbt_project.yml` |

In ClickHouse, schemas map to **databases** — `raw`, `staging`, and `marts` each become a separate ClickHouse database. The `generate_schema_name` macro ensures custom schema names are used as-is without a target prefix.

## Getting started

### Prerequisites

- Docker (for the ClickHouse database)
- [dbt-clickhouse](https://docs.getdbt.com/docs/core/connect-data-platform/clickhouse-setup) installed

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

## Model lineage

```
raw.customers ──► stg_customers ──┐
                                  ├──► orders ──► customers
raw.flowers   ──► stg_flowers   ──┤            └──► flower_performance
                                  │
raw.orders    ──► stg_orders    ──┘
```

## Project structure

```
phase-4/
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
