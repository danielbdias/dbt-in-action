# Phase 3 — Floricultura: Marts e Regras de Negócio

> Read in [English](./README.md)

Esta fase expande a Phase 2 introduzindo uma **camada de marts** que aplica regras de negócio, une dados entre domínios e expõe tabelas limpas e prontas para consumo por ferramentas de analytics e BI.

## O que esta fase cobre

- **Seeds** — mesmos dados CSV brutos carregados no schema `raw`
- **Modelos de staging** — mesmas views tipadas e limpas da Phase 2 no schema `staging`
- **Modelos de mart** — três tabelas no schema `marts` que aplicam lógica de negócio e expõem os dados

## Marts

Todos os modelos de mart são materializados como **tables** no schema `marts`.

### `orders`
Fato de pedido enriquecido. Une `stg_orders` com `stg_customers` e `stg_flowers` para produzir uma linha desnormalizada por pedido, incluindo:
- Nome, e-mail e cidade do cliente
- Nome, categoria e cor da flor
- `order_total_cents` e `order_total_dollars` (quantidade × preço unitário)
- Flag `is_delivered`

### `customers`
Visão 360 do cliente. Combina `stg_customers` com métricas agregadas de `orders`:
- `total_orders`, `total_items_ordered`
- `total_spend_cents`, `total_spend_dollars`
- `delivered_orders`
- `first_order_at`, `last_order_at`

Clientes sem pedidos ainda aparecem com métricas zeradas (`coalesce` em todos os agregados).

### `flower_performance`
Performance de vendas por flor. Agrega `orders` por flor para exibir:
- `total_orders`, `total_units_sold`
- `total_revenue_cents`, `total_revenue_dollars`

Flores sem pedidos ainda aparecem com métricas zeradas.

## Lineage dos modelos

```
raw.customers ──► stg_customers ──┐
                                  ├──► orders ──► customers
raw.flowers   ──► stg_flowers   ──┤            └──► flower_performance
                                  │
raw.orders    ──► stg_orders    ──┘
```

## Como começar

### Pré-requisitos

- Docker (para o banco de dados PostgreSQL)
- [dbt-postgres](https://docs.getdbt.com/docs/core/connect-data-platform/postgres-setup) instalado

### Execute o projeto

```bash
# Inicie o banco de dados
docker compose up -d

# Instale as dependências do dbt
dbt deps

# Carregue os dados de seed
dbt seed

# Construa todos os modelos (staging + marts)
dbt run

# Execute todos os testes
dbt test
```

## Estrutura do projeto

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
