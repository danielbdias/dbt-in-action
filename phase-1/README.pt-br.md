# Phase 1 — Floricultura: Seeds e Definições de Source

> Read in [English](./README.md)

Este é um projeto [dbt](https://www.getdbt.com/) que modela dados de uma floricultura fictícia. Utiliza **PostgreSQL** como data warehouse.

## O que esta fase cobre

A Phase 1 foca na fundação do projeto dbt:

- **Seeds** — carregamento de dados CSV brutos no schema `raw` do banco de dados
- **Definições de source** — declaração e documentação das tabelas brutas para que os modelos downstream possam referenciá-las via `{{ source() }}`

## Seeds

Três arquivos CSV são carregados como tabelas brutas no schema `raw`:

| Seed | Tabela | Descrição |
|---|---|---|
| `seeds/customers.csv` | `raw.customers` | 15 clientes com informações de contato e data de cadastro |
| `seeds/flowers.csv` | `raw.flowers` | 15 produtos de flores com categoria, cor, preço e status de estoque |
| `seeds/orders.csv` | `raw.orders` | 35 pedidos vinculando clientes a flores, com quantidade, timestamp e status |

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

# Verifique a conexão e a configuração
dbt debug
```

## Estrutura do projeto

```
phase-1/
├── seeds/
│   ├── customers.csv
│   ├── flowers.csv
│   └── orders.csv
├── models/
│   └── sources.yml       # Definições de source para as tabelas de seed brutas
├── dbt_project.yml
├── packages.yml
└── profiles.yml
```
