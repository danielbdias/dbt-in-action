{{ config(
    engine='MergeTree()',
    order_by='order_id'
) }}

with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

flowers as (
    select * from {{ ref('stg_flowers') }}
),

final as (
    select
        o.order_id,
        o.ordered_at,
        o.status,
        o.is_delivered,

        o.customer_id,
        c.full_name          as customer_name,
        c.email              as customer_email,
        c.city               as customer_city,

        o.flower_id,
        f.name               as flower_name,
        f.category           as flower_category,
        f.color              as flower_color,

        o.quantity,
        f.price_cents,
        f.price_dollars,
        o.quantity * f.price_cents                      as order_total_cents,
        round(o.quantity * f.price_dollars, 2)          as order_total_dollars
    from orders o
    left join customers c using (customer_id)
    left join flowers   f using (flower_id)
)

select * from final
