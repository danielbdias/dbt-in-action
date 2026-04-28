with customers as (
    select * from {{ ref('stg_customers') }}
),

order_stats as (
    select
        customer_id,
        count(order_id)                                     as total_orders,
        sum(quantity)                                       as total_items_ordered,
        sum(order_total_cents)                              as total_spend_cents,
        round(sum(order_total_dollars), 2)                  as total_spend_dollars,
        count(order_id) filter (where is_delivered)         as delivered_orders,
        min(ordered_at)                                     as first_order_at,
        max(ordered_at)                                     as last_order_at
    from {{ ref('orders') }}
    group by customer_id
),

final as (
    select
        c.customer_id,
        c.full_name,
        c.email,
        c.city,
        c.signup_date,

        coalesce(o.total_orders, 0)             as total_orders,
        coalesce(o.total_items_ordered, 0)      as total_items_ordered,
        coalesce(o.total_spend_cents, 0)        as total_spend_cents,
        coalesce(o.total_spend_dollars, 0)      as total_spend_dollars,
        coalesce(o.delivered_orders, 0)         as delivered_orders,
        o.first_order_at,
        o.last_order_at
    from customers c
    left join order_stats o using (customer_id)
)

select * from final
