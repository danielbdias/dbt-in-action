# Phase 2 — Floricultura: Modelos de Staging e Testes

> Read in [English](./README.md)

Esta fase expande a Phase 1 introduzindo **modelos de staging** que limpam e tipam os dados de seed brutos, e adicionando **testes de dados** tanto nas sources quanto nos modelos de staging.

## O que esta fase cobre

- **Seeds** — mesmos dados CSV brutos da Phase 1 carregados no schema `raw`
- **Testes de source** — testes genéricos (unique, not_null, accepted_values, relationships) aplicados diretamente às tabelas de source brutas
- **Modelos de staging** — uma view por tabela bruta que realiza cast de tipos, renomeia colunas e deriva campos simples
- **Testes de staging** — o mesmo conjunto de testes aplicado à camada de staging, com integridade referencial verificada via `ref()`

## Modelos de staging

| Modelo | Source | Transformações principais |
|---|---|---|
| `stg_customers` | `raw.customers` | Cast de `signup_date` para date; deriva `full_name` |
| `stg_flowers` | `raw.flowers` | Cast de `in_stock` para boolean como `is_in_stock`; deriva `price_dollars` |
| `stg_orders` | `raw.orders` | Cast de `quantity` para integer e `ordered_at` para timestamp; deriva flag `is_delivered` |

Todos os modelos de staging são materializados como **views** no schema `staging`.

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

# Construa os modelos de staging
dbt run

# Execute todos os testes
dbt test
```

## Estrutura do projeto

```
phase-2/
├── seeds/
│   ├── customers.csv
│   ├── flowers.csv
│   └── orders.csv
├── models/
│   ├── sources.yml                  # Declarações de source + testes de source
│   └── staging/
│       ├── stg_customers.sql
│       ├── stg_flowers.sql
│       ├── stg_orders.sql
│       └── stg_flower_shop.yml      # Documentação + testes dos modelos de staging
├── dbt_project.yml
├── packages.yml
└── profiles.yml
```
