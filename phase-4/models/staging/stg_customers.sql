with source as (
    select * from {{ source('raw', 'customers') }}
),

renamed as (
    select
        customer_id,
        first_name,
        last_name,
        concat(first_name, ' ', last_name)  as full_name,
        email,
        city,
        signup_date
    from source
)

select * from renamed
