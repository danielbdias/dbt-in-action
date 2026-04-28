with source as (
    select * from {{ source('raw', 'customers') }}
),

renamed as (
    select
        customer_id,
        first_name,
        last_name,
        first_name || ' ' || last_name   as full_name,
        email,
        city,
        cast(signup_date as date)        as signup_date
    from source
)

select * from renamed
