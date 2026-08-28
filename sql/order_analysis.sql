-- Olist E-commerce SQL Analysis
-- Order Analysis

-- 1. Order Status Distribution

SELECT
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;


-- 2. Orders by Customer State

SELECT
    c.customer_state,
    COUNT(o.order_id) AS order_count
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY order_count DESC;