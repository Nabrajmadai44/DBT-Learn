
{{config(
    materialized = 'table'
)}}

with src as (
    select * from 
    {{ source(
        'postgres',
        'customer'
    )}}
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
    nationality,
    created_date,
    modified_date
from src