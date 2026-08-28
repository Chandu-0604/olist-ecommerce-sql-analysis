-- Olist E-commerce SQL Analysis
-- Product Analysis


-- 1. Top 5 Products by Delivered Revenue

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_category_name,
        SUM(oi.price) AS total_revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    JOIN products AS p
        ON oi.product_id = p.product_id
    WHERE o.order_status = 'delivered'
    GROUP BY
        p.product_id,
        p.product_category_name
),

ranked_products AS (
    SELECT
        product_id,
        product_category_name,
        ROUND(total_revenue, 2) AS total_revenue,
        RANK() OVER (
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM product_revenue
)

SELECT
    revenue_rank,
    product_id,
    product_category_name,
    total_revenue
FROM ranked_products
WHERE revenue_rank <= 5
ORDER BY revenue_rank;


-- 2. Top 5 Products by Revenue Within Each Category

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_category_name,
        SUM(oi.price) AS total_revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    JOIN products AS p
        ON oi.product_id = p.product_id
    WHERE o.order_status = 'delivered'
    GROUP BY
        p.product_id,
        p.product_category_name
),

ranked_products AS (
    SELECT
        product_id,
        product_category_name,
        ROUND(total_revenue, 2) AS total_revenue,
        RANK() OVER (
            PARTITION BY product_category_name
            ORDER BY total_revenue DESC
        ) AS category_rank
    FROM product_revenue
)

SELECT
    category_rank,
    product_category_name,
    product_id,
    total_revenue
FROM ranked_products
WHERE category_rank <= 5
ORDER BY
    product_category_name,
    category_rank;