# Phase 1 — Flower Shop: Seeds & Source Definitions

> Leia em [Português Brasileiro](./README.pt-br.md)

This is a [dbt](https://www.getdbt.com/) project modelling data for a fictional flower shop. It uses **PostgreSQL** as the data warehouse.

## What this phase covers

Phase 1 focuses on the foundation of the dbt project:

- **Seeds** — loading raw CSV data into the `raw` schema of the database
- **Source definitions** — declaring and documenting the raw tables so downstream models can reference them via `{{ source() }}`

## Seeds

Three CSV files are loaded as raw tables under the `raw` schema:

| Seed | Table | Description |
|---|---|---|
| `seeds/customers.csv` | `raw.customers` | 15 customers with contact info and signup date |
| `seeds/flowers.csv` | `raw.flowers` | 15 flower products with category, color, price, and stock status |
| `seeds/orders.csv` | `raw.orders` | 35 orders linking customers to flowers, with quantity, timestamp, and status |

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

# Verify connection and setup
dbt debug
```

## Project structure

```
phase-1/
├── seeds/
│   ├── customers.csv
│   ├── flowers.csv
│   └── orders.csv
├── models/
│   └── sources.yml       # Source definitions for raw seed tables
├── dbt_project.yml
├── packages.yml
└── profiles.yml
```
