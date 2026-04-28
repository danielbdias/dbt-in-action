# Phase 2 — Flower Shop: Staging Models & Testing

> Leia em [Português Brasileiro](./README.pt-br.md)

This phase builds on Phase 1 by introducing **staging models** that clean and type the raw seed data, and adding **data tests** to both sources and staging models.

## What this phase covers

- **Seeds** — same raw CSV data from Phase 1 loaded into the `raw` schema
- **Source tests** — generic tests (unique, not_null, accepted_values, relationships) applied directly to raw source tables
- **Staging models** — one view per raw table that casts types, renames columns, and derives simple fields
- **Staging tests** — the same test suite applied to the staging layer, with referential integrity checked via `ref()`

## Staging models

| Model | Source | Key transformations |
|---|---|---|
| `stg_customers` | `raw.customers` | Casts `signup_date` to date; derives `full_name` |
| `stg_flowers` | `raw.flowers` | Casts `in_stock` to boolean as `is_in_stock`; derives `price_dollars` |
| `stg_orders` | `raw.orders` | Casts `quantity` to integer and `ordered_at` to timestamp; derives `is_delivered` flag |

All staging models are materialized as **views** in the `staging` schema.

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

# Build staging models
dbt run

# Run all tests
dbt test
```

## Project structure

```
phase-2/
├── seeds/
│   ├── customers.csv
│   ├── flowers.csv
│   └── orders.csv
├── models/
│   ├── sources.yml                  # Source declarations + source tests
│   └── staging/
│       ├── stg_customers.sql
│       ├── stg_flowers.sql
│       ├── stg_orders.sql
│       └── stg_flower_shop.yml      # Staging model docs + tests
├── dbt_project.yml
├── packages.yml
└── profiles.yml
```
