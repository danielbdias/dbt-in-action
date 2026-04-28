---
marp: true
theme: default
paginate: true
style: |
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');

  :root {
    --orange: #FF694B;
    --dark:   #1B2330;
    --gray:   #F5F6F8;
    --muted:  #6B7280;
    --text:   #111827;
    --border: #E5E7EB;
  }

  section {
    font-family: 'Inter', 'Helvetica Neue', Arial, sans-serif;
    background: #ffffff;
    color: var(--text);
    padding: 56px 72px;
    font-size: 22px;
    line-height: 1.6;
  }

  section::after {
    font-size: 14px;
    color: var(--muted);
  }

  h1, h2, h3 {
    font-weight: 700;
    line-height: 1.2;
    margin-top: 0;
  }

  h1 { font-size: 2.2em; color: var(--text); }
  h2 { font-size: 1.6em; color: var(--text); margin-bottom: 24px; }
  h3 { font-size: 1.1em; color: var(--orange); text-transform: uppercase;
       letter-spacing: 0.08em; margin-bottom: 8px; }

  strong { color: var(--orange); font-weight: 600; }

  code {
    background: var(--gray);
    color: var(--dark);
    padding: 2px 7px;
    border-radius: 4px;
    font-size: 0.88em;
  }

  pre {
    background: var(--dark);
    color: #E2E8F0;
    border-radius: 10px;
    padding: 24px 28px;
    font-size: 0.78em;
    line-height: 1.7;
  }

  pre code {
    background: transparent;
    color: inherit;
    padding: 0;
    font-size: inherit;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 0.88em;
  }

  th {
    background: var(--dark);
    color: white;
    padding: 10px 16px;
    text-align: left;
    font-weight: 600;
  }

  td {
    padding: 10px 16px;
    border-bottom: 1px solid var(--border);
  }

  tr:nth-child(even) td { background: var(--gray); }

  ul {
    padding-left: 1.2em;
  }

  li { margin-bottom: 6px; }

  /* ── Cover slide ── */
  section.cover {
    background: var(--dark);
    color: #ffffff;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    padding-bottom: 80px;
    background-image:
      radial-gradient(ellipse at 80% 20%, rgba(255,105,75,0.18) 0%, transparent 55%),
      radial-gradient(ellipse at 10% 80%, rgba(255,105,75,0.10) 0%, transparent 45%);
  }

  section.cover::after { color: rgba(255,255,255,0.35); }

  section.cover .label {
    font-size: 0.7em;
    font-weight: 600;
    letter-spacing: 0.14em;
    text-transform: uppercase;
    color: var(--orange);
    margin-bottom: 20px;
  }

  section.cover h1 {
    font-size: 3.8em;
    font-weight: 800;
    color: #ffffff;
    line-height: 1.05;
    margin: 0 0 20px;
  }

  section.cover h1 span {
    color: var(--orange);
  }

  section.cover p {
    font-size: 1.05em;
    color: rgba(255,255,255,0.65);
    margin: 0;
    max-width: 680px;
  }

  /* ── Speaker slide ── */
  section.speaker {
    background: var(--gray);
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  section.speaker .speaker-layout {
    display: flex;
    align-items: center;
    gap: 64px;
    margin-top: 16px;
  }

  section.speaker .avatar {
    width: 220px;
    height: 220px;
    border-radius: 50%;
    overflow: hidden;
    flex-shrink: 0;
    border: 5px solid var(--orange);
  }

  section.speaker .avatar img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
  }

  section.speaker .bio h2 {
    font-size: 2em;
    margin-bottom: 6px;
    color: var(--text);
  }

  section.speaker .bio .role {
    font-size: 1em;
    color: var(--orange);
    font-weight: 600;
    margin-bottom: 20px;
  }

  section.speaker .bio .about {
    font-size: 0.88em;
    color: var(--muted);
    line-height: 1.7;
  }

  section.speaker .bio .links {
    margin-top: 20px;
    font-size: 0.88em;
    color: var(--muted);
  }

  section.speaker .bio .links span {
    display: inline-block;
    margin-right: 28px;
  }

  /* ── Section divider ── */
  section.divider {
    background: var(--dark);
    color: #ffffff;
    display: flex;
    flex-direction: column;
    justify-content: center;
    background-image:
      radial-gradient(ellipse at 90% 10%, rgba(255,105,75,0.2) 0%, transparent 50%);
  }

  section.divider::after { color: rgba(255,255,255,0.35); }

  section.divider h2 {
    font-size: 2.6em;
    color: #ffffff;
    margin: 0;
  }

  section.divider p {
    color: rgba(255,255,255,0.6);
    margin-top: 12px;
    font-size: 1em;
  }

  section.divider .phase-badge {
    font-size: 0.72em;
    font-weight: 700;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    color: var(--orange);
    margin-bottom: 16px;
  }

  /* ── Two-column layout ── */
  .cols {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 40px;
    margin-top: 8px;
  }

  .cols-3 {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 28px;
    margin-top: 8px;
  }

  /* ── Card ── */
  .card {
    background: var(--gray);
    border-radius: 12px;
    padding: 28px;
    border-left: 4px solid var(--orange);
  }

  .card h3 {
    font-size: 0.8em;
    margin-bottom: 10px;
  }

  .card p, .card ul {
    font-size: 0.82em;
    color: var(--muted);
    margin: 0;
    padding-left: 1.1em;
  }

  .card ul li { margin-bottom: 4px; }

  /* ── Lineage diagram ── */
  .lineage {
    background: var(--dark);
    color: #E2E8F0;
    border-radius: 12px;
    padding: 32px 36px;
    font-family: 'Courier New', monospace;
    font-size: 0.82em;
    line-height: 2;
  }

  .lineage .raw    { color: #94A3B8; }
  .lineage .stg    { color: #60A5FA; }
  .lineage .mart   { color: var(--orange); }
  .lineage .arrow  { color: #475569; }

  /* ── Pill badge ── */
  .pill {
    display: inline-block;
    background: rgba(255,105,75,0.12);
    color: var(--orange);
    border: 1px solid rgba(255,105,75,0.3);
    border-radius: 20px;
    padding: 3px 14px;
    font-size: 0.75em;
    font-weight: 600;
    margin-right: 6px;
    margin-bottom: 6px;
  }

  /* ── Highlight box ── */
  .highlight {
    background: rgba(255,105,75,0.08);
    border-left: 4px solid var(--orange);
    border-radius: 0 8px 8px 0;
    padding: 16px 20px;
    font-size: 0.9em;
    margin-top: 16px;
    color: var(--text);
  }
---

<!-- _class: cover -->
<!-- _paginate: false -->

<div class="label">Analytics Engineering na Prática</div>

# dbt em <span>Ação</span>

Construindo um projeto de analytics de ponta a ponta — de seeds CSV brutos
a modelos de mart prontos para produção — fase a fase.

---

<!-- _class: speaker -->
<!-- _paginate: false -->

## Sobre mim

<div class="speaker-layout">
<div class="avatar"><img src="./daniel-2025.png" alt="Daniel Dias" /></div>
<div class="bio">
<h2>Daniel Dias</h2>
<div class="role">Engenheiro de Software Sênior · dbt Labs</div>
<div class="about">
Apaixonado por Ferramentas para Desenvolvedores e engenharia de dados.<br>
Construindo ferramentas que tornam as equipes de dados mais produtivas.
</div>
<div class="links">
<span>🔗 LinkedIn: <strong>@danielbdias</strong></span>
<span>🐙 GitHub: <strong>@danielbdias</strong></span>
<span>📧 <strong>daniel.baptistadias@dbtlabs.com</strong></span>
</div>
</div>
</div>

---

## Agenda

<div class="cols-3">
<div class="card">
<h3>Fase 1</h3>
<p><strong>Seeds & Sources</strong></p>
<ul>
<li>Carregue dados CSV com <code>dbt seed</code></li>
<li>Declare tabelas brutas como sources</li>
<li>Use <code>{{ source() }}</code> nos modelos</li>
</ul>
</div>
<div class="card">
<h3>Fase 2</h3>
<p><strong>Staging & Testes</strong></p>
<ul>
<li>Views de staging tipadas e limpas</li>
<li>Testes genéricos e singulares</li>
<li>Verificações de integridade referencial</li>
</ul>
</div>
<div class="card">
<h3>Fase 3</h3>
<p><strong>Marts & Regras de Negócio</strong></p>
<ul>
<li>Joins de fatos e dimensões</li>
<li>Métricas agregadas</li>
<li>Tabelas prontas para consumo</li>
</ul>
</div>
</div>

<div class="highlight">
Cada fase é um projeto dbt independente — escolha qualquer fase e execute de forma isolada.
</div>

---

## Contexto: ETL — Extrair, Transformar, Carregar

<div class="cols-3">
<div class="card">
<h3>Extrair</h3>
<p>Coleta dados brutos dos sistemas de origem — APIs, bancos de dados, arquivos, ferramentas SaaS.</p>
</div>
<div class="card">
<h3>Transformar</h3>
<p>Limpa, reestrutura e enriquece os dados <strong>antes</strong> de chegarem ao warehouse — normalmente em uma camada de middleware dedicada.</p>
</div>
<div class="card">
<h3>Carregar</h3>
<p>Grava os dados já transformados no destino — um data warehouse ou data mart pronto para consumo.</p>
</div>
</div>

<div class="highlight">
O ETL era o padrão quando warehouses eram caros e o armazenamento era limitado. As transformações aconteciam <strong>fora</strong> do warehouse para minimizar o que era armazenado.
</div>

---

## Contexto: ELT — Extrair, Carregar, Transformar

<div class="cols-3">
<div class="card">
<h3>Extrair</h3>
<p>Coleta dados brutos dos sistemas de origem — APIs, bancos de dados, arquivos, ferramentas SaaS — e os disponibiliza para carga.</p>
</div>
<div class="card">
<h3>Carregar</h3>
<p>Persiste os dados brutos como estão no data warehouse. Sem transformações ainda — preservando fidelidade e a capacidade de reprocessamento.</p>
</div>
<div class="card">
<h3>Transformar</h3>
<p>Modela os dados brutos em modelos limpos, testados e prontos para o negócio <strong>dentro do warehouse</strong>. É aqui que o <strong>dbt</strong> atua.</p>
</div>
</div>

<div class="highlight">
No ELT, o warehouse é o motor de transformação. O dbt cuida do <strong>T</strong> — escrevendo transformações SQL como código versionado e testável.
</div>

---

## ETL vs ELT

| | **ETL** | **ELT** |
|---|---|---|
| **Etapa de transformação** | Antes da carga — no middleware | Após a carga — dentro do warehouse |
| **Dados brutos armazenados?** | Não — apenas o resultado transformado | Sim — histórico completo preservado |
| **Papel do warehouse** | Apenas destino | Motor de transformação |
| **Ferramentas** | Informatica, SSIS, Talend | dbt, Spark SQL, BigQuery |
| **Melhor para** | Sistemas legados, armazenamento limitado | Data warehouses modernos na nuvem |
| **Velocidade de iteração** | Lenta — redesploy de pipelines para mudar lógica | Rápida — edite o SQL e execute novamente |

<div class="highlight">
Os data warehouses modernos na nuvem (BigQuery, Snowflake, Redshift, DuckDB) tornaram o armazenamento barato e o processamento elástico — eliminando a justificativa original do ETL. <strong>ELT é agora o padrão</strong> para analytics engineering.
</div>

---

## ELT Viabiliza o SDLC para Dados

Como as transformações são **código**, elas herdam todo o ferramental da engenharia de software.

<div class="cols-3">
<div class="card">
<h3>Controle de Versão</h3>
<p>Cada transformação vive no Git — histórico completo, rollback e rastreabilidade incluídos.</p>
</div>
<div class="card">
<h3>Revisão de Código</h3>
<p>Mudanças na lógica passam por pull requests antes de chegar aos dados de produção.</p>
</div>
<div class="card">
<h3>Testes Automatizados</h3>
<p><code>dbt test</code> roda no CI a cada commit — schema, integridade referencial e assertions customizadas.</p>
</div>
</div>
<div class="cols-3" style="margin-top: 16px;">
<div class="card">
<h3>Isolamento de Ambientes</h3>
<p>Schemas separados para <code>dev</code>, <code>staging</code> e <code>prod</code> — experimentos nunca vazam para a produção.</p>
</div>
<div class="card">
<h3>Reprodutibilidade</h3>
<p>Qualquer modelo pode ser reconstruído com um único <code>dbt run</code> — sem etapas manuais, sem surpresas.</p>
</div>
<div class="card">
<h3>Controle de Acesso</h3>
<p>Os dados ficam no warehouse sob seu perímetro de segurança existente — sem middleware externo.</p>
</div>
</div>

<div class="highlight">
Com o dbt, o seu <strong>T</strong> é versionado, revisado, testado e implantado — assim como código de produção.
</div>

---

## O Cenário — 🌸 Floricultura

Uma floricultura fictícia com três entidades de dados brutos:

| Entidade | Tabela | Descrição |
|---|---|---|
| 👥 **Clientes** | `raw.customers` | 15 clientes — informações de contato e data de cadastro |
| 🌷 **Flores** | `raw.flowers` | 15 produtos — categoria, cor, preço, disponibilidade em estoque |
| 📦 **Pedidos** | `raw.orders` | 35 pedidos — cliente × flor, quantidade, timestamp, status |

**Stack:**
<span class="pill">dbt Core</span>
<span class="pill">PostgreSQL 16</span>
<span class="pill">Docker</span>
<span class="pill">dbt-postgres adapter</span>

<div class="highlight">
Todos os dados de origem são carregados como seeds CSV — nenhum pipeline externo necessário. Suba o Docker e você já está pronto.
</div>

---

<!-- _class: divider -->

<div class="phase-badge">Fase 1</div>

## Seeds & Definições de Source

Carregando dados brutos e declarando-os como fontes confiáveis.

---

## Fase 1 — Seeds & Definições de Source

<div class="cols">
<div>

### O que você aprende

- Carregar arquivos CSV no banco de dados com **`dbt seed`**
- Declarar tabelas brutas em `sources.yml` para que modelos downstream usem `{{ source() }}`
- Documentar e descrever dados brutos na camada de source

### Estrutura do projeto

```
phase-1/
├── seeds/
│   ├── customers.csv
│   ├── flowers.csv
│   └── orders.csv
└── models/
    └── sources.yml
```

</div>
<div>

### Execute

```bash
# Inicie o banco de dados
docker compose up -d

# Instale os pacotes dbt
dbt deps

# Carregue os seeds CSV no schema raw
dbt seed

# Verifique a configuração
dbt debug
```

### Resultado

Três tabelas brutas são criadas no schema **`raw`**:
`raw.customers`, `raw.flowers`, `raw.orders`

</div>
</div>

---

<!-- _class: divider -->

<div class="phase-badge">Fase 2</div>

## Modelos de Staging & Testes

Limpando dados brutos e garantindo qualidade com testes.

---

## Fase 2 — Modelos de Staging & Testes

<div class="cols">
<div>

### Modelos de staging

| Modelo | Transformações principais |
|---|---|
| `stg_customers` | Cast de `signup_date` → date; deriva `full_name` |
| `stg_flowers` | Cast de `in_stock` → boolean `is_in_stock`; deriva `price_dollars` |
| `stg_orders` | Cast de `quantity` → int, `ordered_at` → timestamp; deriva `is_delivered` |

Todos os modelos de staging são **views** no schema `staging`.

</div>
<div>

### Suite de testes

```yaml
models:
  - name: stg_customers
    columns:
      - name: customer_id
        tests:
          - unique
          - not_null
      - name: email
        tests:
          - unique
          - not_null
  - name: stg_orders
    columns:
      - name: customer_id
        tests:
          - relationships:
              to: ref('stg_customers')
              field: customer_id
```

</div>
</div>

---

<!-- _class: divider -->

<div class="phase-badge">Fase 3</div>

## Marts & Regras de Negócio

Joins, agregações e tabelas prontas para consumo.

---

## Fase 3 — Modelos de Mart

<div class="cols-3">
<div class="card">
<h3>orders</h3>
<p>Fato de pedido enriquecido — linha desnormalizada por pedido com informações do cliente, da flor, <code>order_total_dollars</code> e flag <code>is_delivered</code>.</p>
</div>
<div class="card">
<h3>customers</h3>
<p>Visão 360 do cliente — combina dados de perfil com métricas agregadas de pedidos: <code>total_spend_dollars</code>, <code>total_orders</code>, <code>first_order_at</code>. Clientes sem pedidos aparecem com métricas zeradas.</p>
</div>
<div class="card">
<h3>flower_performance</h3>
<p>Performance de vendas por flor — <code>total_orders</code>, <code>total_units_sold</code>, <code>total_revenue_dollars</code>. Flores sem pedidos aparecem com métricas zeradas.</p>
</div>
</div>

Todos os modelos de mart são materializados como **tables** no schema `marts`.

```bash
dbt run    # constrói as camadas de staging e mart
dbt test   # executa a suite completa de testes em todas as camadas
```

---

## Linhagem dos Modelos

<div class="lineage">
<span class="raw">raw.customers</span> <span class="arrow">──►</span> <span class="stg">stg_customers</span> <span class="arrow">──┐</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="arrow">├──►</span> <span class="mart">orders</span> <span class="arrow">──►</span> <span class="mart">customers</span><br>
<span class="raw">raw.flowers&nbsp;&nbsp;</span> <span class="arrow">──►</span> <span class="stg">stg_flowers&nbsp;&nbsp;</span> <span class="arrow">──┤</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="arrow">└──►</span> <span class="mart">flower_performance</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="arrow">│</span><br>
<span class="raw">raw.orders&nbsp;&nbsp;&nbsp;</span> <span class="arrow">──►</span> <span class="stg">stg_orders&nbsp;&nbsp;&nbsp;</span> <span class="arrow">──┘</span>
</div>

<div class="cols" style="margin-top: 24px;">
<div>
<span class="pill">raw.*</span> Seeds carregados pelo <code>dbt seed</code>
</div>
<div>
<span class="pill">stg_*</span> Views limpas — camada de staging
</div>
</div>
<div>
<span class="pill" style="background:rgba(255,105,75,0.2);">marts</span> Tabelas prontas para o negócio — camada final
</div>

---

## Início Rápido

```bash
# 1. Clone o repositório e inicie o banco de dados
git clone https://github.com/danielbdias/dbt-in-action
docker compose up -d

# 2. Navegue até a fase que deseja explorar
cd phase-3

# 3. Instale os pacotes dbt
dbt deps

# 4. Carregue os dados seed
dbt seed

# 5. Construa todos os modelos
dbt run

# 6. Execute todos os testes
dbt test
```

**Conexão com o PostgreSQL:**
`localhost:54321` · usuário: `postgres` · senha: `postgres` · banco: `postgres`

---

<!-- _class: cover -->
<!-- _paginate: false -->

<div class="label">dbt em Ação — Floricultura</div>

# Obrigado<span>!</span>

Perguntas? Vamos conversar sobre dbt, qualidade de dados e analytics engineering.

<br>

🔗 **github.com/danielbdias/dbt-in-action**
