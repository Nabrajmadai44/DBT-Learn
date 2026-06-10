
{{config(
    materialized = 'incremental'
)}}

with src as (
    select * from 
    {{ source(
        'postgres',
        'customer'
    )}}
    {% if is_incremental() %}
        where modified_at > (select max(modified_at) from {{ this }})
    {% endif %}
)
select
    cust_id,
    name,
    address,
    phone_number,
    postal_code,
    country,
    email,
    father_name,
    mother_name,
    occupation,
    education,
    nationality
from src