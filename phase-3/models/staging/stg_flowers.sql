with source as (
    select * from {{ source('raw', 'flowers') }}
),

renamed as (
    select
        flower_id,
        name,
        category,
        color,
        price_cents,
        round(price_cents / 100.0, 2)   as price_dollars,
        cast(in_stock as boolean)        as is_in_stock
    from source
)

select * from renamed
