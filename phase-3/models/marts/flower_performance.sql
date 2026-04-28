with flowers as (
    select * from {{ ref('stg_flowers') }}
),

order_stats as (
    select
        flower_id,
        count(order_id)                     as total_orders,
        sum(quantity)                       as total_units_sold,
        sum(order_total_cents)              as total_revenue_cents,
        round(sum(order_total_dollars), 2)  as total_revenue_dollars
    from {{ ref('orders') }}
    group by flower_id
),

final as (
    select
        f.flower_id,
        f.name,
        f.category,
        f.color,
        f.price_cents,
        f.price_dollars,
        f.is_in_stock,

        coalesce(o.total_orders, 0)          as total_orders,
        coalesce(o.total_units_sold, 0)      as total_units_sold,
        coalesce(o.total_revenue_cents, 0)   as total_revenue_cents,
        coalesce(o.total_revenue_dollars, 0) as total_revenue_dollars
    from flowers f
    left join order_stats o using (flower_id)
)

select * from final
