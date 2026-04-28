with source as (
    select * from {{ source('raw', 'orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        flower_id,
        quantity,
        ordered_at,
        status,
        status = 'delivered'   as is_delivered
    from source
)

select * from renamed
