
----SCD Type 1 overwrites old customer information with updated information

UPDATE warehouse.dim_customer d

SET
    customer_name = s.customer_name,
    email = s.email,
    gender = s.gender,
    city = s.city,
    state = s.state,
    country = s.country,
    updated_at = CURRENT_TIMESTAMP

FROM staging.stg_customers s

WHERE d.customer_id = s.customer_id

AND (
    d.customer_name IS DISTINCT FROM s.customer_name
    OR d.email IS DISTINCT FROM s.email
    OR d.gender IS DISTINCT FROM s.gender
    OR d.city IS DISTINCT FROM s.city
    OR d.state IS DISTINCT FROM s.state
    OR d.country IS DISTINCT FROM s.country
);