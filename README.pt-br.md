# dbt in Action — Floricultura

> Read in [English](./README.md)

Um sandbox prático de dbt que constrói um projeto de analytics completo para uma floricultura fictícia, fase a fase. Cada fase é um projeto dbt independente que apresenta novos conceitos sobre os anteriores.

## O cenário

Os dados da floricultura consistem em três entidades:

| Entidade | Descrição |
|---|---|
| **Customers** | 15 clientes com informações de contato e data de cadastro |
| **Flowers** | 15 produtos com categoria, cor, preço e status de estoque |
| **Orders** | 35 pedidos vinculando clientes a flores, com quantidade, timestamp e status |

## Fases

| Fase | Foco | Conceitos-chave |
|---|---|---|
| [Phase 1](./phase-1/README.pt-br.md) | Seeds e definições de source | `dbt seed`, `{{ source() }}`, YAML de source |
| [Phase 2](./phase-2/README.pt-br.md) | Modelos de staging e testes | Views de staging tipadas, testes genéricos, integridade referencial |
| [Phase 3](./phase-3/README.pt-br.md) | Marts e regras de negócio | Joins entre fatos e dimensões, métricas agregadas, lineage com `{{ ref() }}` |

### Lineage dos modelos (Phases 2–3)

```
raw.customers ──► stg_customers ──┐
                                  ├──► orders ──► customers
raw.flowers   ──► stg_flowers   ──┤            └──► flower_performance
                                  │
raw.orders    ──► stg_orders    ──┘
```

## Pré-requisitos

- [Docker](https://www.docker.com/) — executa o banco de dados local
- [dbt Core](https://docs.getdbt.com/docs/core/installation-overview) com o adaptador `dbt-postgres`

## Início rápido

```bash
# 1. Inicie o banco de dados
docker compose up -d

# 2. Navegue até a fase que deseja executar
cd phase-3

# 3. Instale os pacotes dbt
dbt deps

# 4. Carregue os dados de seed
dbt seed

# 5. Construa os modelos
dbt run

# 6. Execute os testes
dbt test
```

## Banco de dados

O `docker-compose.yml` na raiz do repositório inicia uma instância do PostgreSQL 16:

| Configuração | Valor |
|---|---|
| Host | `localhost` |
| Porta | `54321` |
| Usuário | `postgres` |
| Senha | `postgres` |
| Banco | `postgres` |

O `profiles.yml` de cada fase aponta para essa instância por padrão.
