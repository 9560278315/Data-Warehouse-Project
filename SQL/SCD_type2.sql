
-------SCD Type 2 maintains historical records when customer attributes change.

----------First, add historical tracking columns


ALTER TABLE warehouse.dim_customer
ADD COLUMN IF NOT EXISTS effective_start_date DATE
    DEFAULT CURRENT_DATE;

ALTER TABLE warehouse.dim_customer
ADD COLUMN IF NOT EXISTS effective_end_date DATE
    DEFAULT '9999-12-31';

ALTER TABLE warehouse.dim_customer
ADD COLUMN IF NOT EXISTS is_current BOOLEAN
    DEFAULT TRUE;



    UPDATE warehouse.dim_customer
SET
    effective_start_date = CURRENT_DATE,
    effective_end_date = '9999-12-31',
    is_current = TRUE;



------Expire old records



    UPDATE warehouse.dim_customer d

SET
    effective_end_date = CURRENT_DATE - 1,
    is_current = FALSE

FROM staging.stg_customers s

WHERE d.customer_id = s.customer_id
AND d.is_current = TRUE

AND (
    d.customer_name IS DISTINCT FROM s.customer_name
    OR d.email IS DISTINCT FROM s.email
    OR d.city IS DISTINCT FROM s.city
    OR d.state IS DISTINCT FROM s.state
    OR d.country IS DISTINCT FROM s.country
);

-----Insert new records


INSERT INTO warehouse.dim_customer (
    customer_id,
    customer_name,
    email,
    gender,
    city,
    state,
    country,
    effective_start_date,
    effective_end_date,
    is_current
)
SELECT
    s.customer_id,
    s.customer_name,
    s.email,
    s.gender,
    s.city,
    s.state,
    s.country,
    CURRENT_DATE,
    '9999-12-31',
    TRUE

FROM staging.stg_customers s

WHERE NOT EXISTS (
    SELECT 1
    FROM warehouse.dim_customer d
    WHERE d.customer_id = s.customer_id
    AND d.is_current = TRUE
);