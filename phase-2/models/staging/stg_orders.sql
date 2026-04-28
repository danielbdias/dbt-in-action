with source as (
    select * from {{ source('raw', 'orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        flower_id,
        cast(quantity as integer)               as quantity,
        cast(ordered_at as timestamp)           as ordered_at,
        status,
        status = 'delivered'                    as is_delivered
    from source
)

select * from renamed
