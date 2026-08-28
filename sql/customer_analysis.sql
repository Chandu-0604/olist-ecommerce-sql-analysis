-- Olist E-commerce SQL Analysis
-- Customer Analysis


-- 1. One-Time vs Repeat Customers

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS order_count
    FROM customers AS c
    JOIN orders AS o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)

SELECT
    CASE
        WHEN order_count = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM customer_orders
GROUP BY
    CASE
        WHEN order_count = 1 THEN 'One-time'
        ELSE 'Repeat'
    END
ORDER BY customer_count DESC;


-- 2. Average Order Value by Customer Type

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS order_count
    FROM customers AS c
    JOIN orders AS o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
),

customer_type AS (
    SELECT
        customer_unique_id,
        CASE
            WHEN order_count = 1 THEN 'One-time'
            ELSE 'Repeat'
        END AS customer_type
    FROM customer_orders
),

order_values AS (
    SELECT
        o.order_id,
        c.customer_unique_id,
        SUM(oi.price + oi.freight_value) AS order_value
    FROM orders AS o
    JOIN customers AS c
        ON o.customer_id = c.customer_id
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY
        o.order_id,
        c.customer_unique_id
)

SELECT
    ct.customer_type,
    COUNT(ov.order_id) AS order_count,
    ROUND(AVG(ov.order_value), 2) AS average_order_value
FROM customer_type AS ct
JOIN order_values AS ov
    ON ct.customer_unique_id = ov.customer_unique_id
GROUP BY ct.customer_type
ORDER BY average_order_value DESC;