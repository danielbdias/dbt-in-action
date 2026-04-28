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

<div class="label">Hands-on Analytics Engineering</div>

# dbt in <span>Action</span>

Building an end-to-end analytics project — from raw CSV seeds
to production-ready mart models — phase by phase.

---

<!-- _class: speaker -->
<!-- _paginate: false -->

## About me

<div class="speaker-layout">
<div class="avatar"><img src="./daniel-2025.png" alt="Daniel Dias" /></div>
<div class="bio">
<h2>Daniel Dias</h2>
<div class="role">Senior Software Engineer · dbt Labs</div>
<div class="about">
Passionate about Developer Tools and data engineering.<br>
Building tools that make data teams more productive.
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
<h3>Phase 1</h3>
<p><strong>Seeds & Sources</strong></p>
<ul>
<li>Load CSV data with <code>dbt seed</code></li>
<li>Declare raw tables as sources</li>
<li>Use <code>{{ source() }}</code> in models</li>
</ul>
</div>
<div class="card">
<h3>Phase 2</h3>
<p><strong>Staging & Testing</strong></p>
<ul>
<li>Typed, cleaned staging views</li>
<li>Generic & singular tests</li>
<li>Referential integrity checks</li>
</ul>
</div>
<div class="card">
<h3>Phase 3</h3>
<p><strong>Marts & Business Logic</strong></p>
<ul>
<li>Fact & dimension joins</li>
<li>Aggregated metrics</li>
<li>Consumption-ready tables</li>
</ul>
</div>
</div>

<div class="highlight">
Each phase is a self-contained dbt project — pick up any phase and run it independently.
</div>

---

## The Scenario — 🌸 Flower Shop

A fictional flower shop with three raw data entities:

| Entity | Table | Description |
|---|---|---|
| 👥 **Customers** | `raw.customers` | 15 customers — contact info & signup date |
| 🌷 **Flowers** | `raw.flowers` | 15 products — category, color, price, stock status |
| 📦 **Orders** | `raw.orders` | 35 orders — customer × flower, quantity, timestamp, status |

**Stack:**
<span class="pill">dbt Core</span>
<span class="pill">PostgreSQL 16</span>
<span class="pill">Docker</span>
<span class="pill">dbt-postgres adapter</span>

<div class="highlight">
All source data is loaded as CSV seeds — no external pipelines needed. Spin up Docker and you're ready to go.
</div>

---

<!-- _class: divider -->

<div class="phase-badge">Phase 1</div>

## Seeds & Source Definitions

Loading raw data and declaring it as trusted sources.

---

## Phase 1 — Seeds & Source Definitions

<div class="cols">
<div>

### What you learn

- Load CSV files into the database with **`dbt seed`**
- Declare raw tables in `sources.yml` so downstream models can use `{{ source() }}`
- Document and describe raw data at the source layer

### Project structure

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

### Run it

```bash
# Start the database
docker compose up -d

# Install dbt packages
dbt deps

# Load CSV seeds into raw schema
dbt seed

# Verify setup
dbt debug
```

### Result

Three raw tables land in the **`raw`** schema:
`raw.customers`, `raw.flowers`, `raw.orders`

</div>
</div>

---

<!-- _class: divider -->

<div class="phase-badge">Phase 2</div>

## Staging Models & Testing

Cleaning raw data and asserting quality with tests.

---

## Phase 2 — Staging Models & Testing

<div class="cols">
<div>

### Staging models

| Model | Key transformations |
|---|---|
| `stg_customers` | Cast `signup_date` → date; derive `full_name` |
| `stg_flowers` | Cast `in_stock` → boolean `is_in_stock`; derive `price_dollars` |
| `stg_orders` | Cast `quantity` → int, `ordered_at` → timestamp; derive `is_delivered` |

All staging models are **views** in the `staging` schema.

</div>
<div>

### Test suite

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

<div class="phase-badge">Phase 3</div>

## Marts & Business Rules

Joins, aggregations, and consumption-ready tables.

---

## Phase 3 — Mart Models

<div class="cols-3">
<div class="card">
<h3>orders</h3>
<p>Enriched order fact — denormalized row per order with customer info, flower info, <code>order_total_dollars</code>, and <code>is_delivered</code> flag.</p>
</div>
<div class="card">
<h3>customers</h3>
<p>Customer 360 — combines profile data with aggregated order metrics: <code>total_spend_dollars</code>, <code>total_orders</code>, <code>first_order_at</code>. Customers with no orders appear with zeroed metrics.</p>
</div>
<div class="card">
<h3>flower_performance</h3>
<p>Per-flower sales performance — <code>total_orders</code>, <code>total_units_sold</code>, <code>total_revenue_dollars</code>. Flowers with no orders appear with zeroed metrics.</p>
</div>
</div>

All mart models are materialized as **tables** in the `marts` schema.

```bash
dbt run    # builds staging + mart layers
dbt test   # runs the full test suite across all layers
```

---

## Model Lineage

<div class="lineage">
<span class="raw">raw.customers</span> <span class="arrow">──►</span> <span class="stg">stg_customers</span> <span class="arrow">──┐</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="arrow">├──►</span> <span class="mart">orders</span> <span class="arrow">──►</span> <span class="mart">customers</span><br>
<span class="raw">raw.flowers&nbsp;&nbsp;</span> <span class="arrow">──►</span> <span class="stg">stg_flowers&nbsp;&nbsp;</span> <span class="arrow">──┤</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="arrow">└──►</span> <span class="mart">flower_performance</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="arrow">│</span><br>
<span class="raw">raw.orders&nbsp;&nbsp;&nbsp;</span> <span class="arrow">──►</span> <span class="stg">stg_orders&nbsp;&nbsp;&nbsp;</span> <span class="arrow">──┘</span>
</div>

<div class="cols" style="margin-top: 24px;">
<div>
<span class="pill">raw.*</span> Seeds loaded by <code>dbt seed</code>
</div>
<div>
<span class="pill">stg_*</span> Cleaned views — staging layer
</div>
</div>
<div>
<span class="pill" style="background:rgba(255,105,75,0.2);">marts</span> Business-ready tables — final layer
</div>

---

## Quickstart

```bash
# 1. Clone the repo and start the database
git clone https://github.com/danielbdias/dbt-in-action
docker compose up -d

# 2. Navigate to the phase you want to explore
cd phase-3

# 3. Install dbt packages
dbt deps

# 4. Load seed data
dbt seed

# 5. Build all models
dbt run

# 6. Run all tests
dbt test
```

**PostgreSQL connection:**
`localhost:54321` · user: `postgres` · password: `postgres` · database: `postgres`

---

<!-- _class: cover -->
<!-- _paginate: false -->

<div class="label">dbt in Action — Flower Shop</div>

# Thank <span>you!</span>

Questions? Let's talk dbt, data quality, and analytics engineering.

<br>

🔗 **github.com/danielbdias/dbt-in-action**

