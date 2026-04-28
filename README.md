# dbt in Action — Flower Shop

A hands-on dbt sandbox that builds an end-to-end analytics project for a fictional flower shop, phase by phase. Each phase is a self-contained dbt project that introduces new concepts on top of the previous one.

## The scenario

The flower shop data consists of three entities:

| Entity | Description |
|---|---|
| **Customers** | 15 customers with contact info and signup date |
| **Flowers** | 15 products with category, color, price, and stock status |
| **Orders** | 35 orders linking customers to flowers, with quantity, timestamp, and status |

## Phases

| Phase | Focus | Key concepts |
|---|---|---|
| [Phase 1](./phase-1/README.md) | Seeds & source definitions | `dbt seed`, `{{ source() }}`, source YAML |
| [Phase 2](./phase-2/README.md) | Staging models & testing | Typed staging views, generic tests, referential integrity |
| [Phase 3](./phase-3/README.md) | Marts & business rules | Fact/dimension joins, aggregated metrics, `{{ ref() }}` lineage |
| [Phase 4](./phase-4/README.md) | Porting to ClickHouse | Adapter swap, ClickHouse-specific materializations |

### Model lineage (Phases 2–3)

```
raw.customers ──► stg_customers ──┐
                                  ├──► orders ──► customers
raw.flowers   ──► stg_flowers   ──┤            └──► flower_performance
                                  │
raw.orders    ──► stg_orders    ──┘
```

## Prerequisites

- [Docker](https://www.docker.com/) — runs the local database
- [dbt Core](https://docs.getdbt.com/docs/core/installation-overview) with the appropriate adapter for the phase you're running:
  - Phases 1–3: `dbt-postgres`
  - Phase 4: `dbt-clickhouse`

## Quickstart

```bash
# 1. Start the database (PostgreSQL for phases 1–3)
docker compose up -d

# 2. Navigate to the phase you want to run
cd phase-3

# 3. Install dbt packages
dbt deps

# 4. Load seed data
dbt seed

# 5. Build models
dbt run

# 6. Run tests
dbt test
```

## Database

The `docker-compose.yml` at the repo root starts a PostgreSQL 16 instance:

| Setting | Value |
|---|---|
| Host | `localhost` |
| Port | `54321` |
| User | `postgres` |
| Password | `postgres` |
| Database | `postgres` |

Each phase's `profiles.yml` points to this instance by default.
