
USE olistdatawarehouse;

-- 1. Top 10 Product Categories by Total Item Value

SELECT
    product_category_name_english AS product_category,
    COUNT(*) AS total_items,
    ROUND(SUM(item_total_value), 2) AS total_item_value
FROM report_order_item_performance
GROUP BY product_category_name_english
ORDER BY total_item_value DESC
LIMIT 10;


-- 2. Monthly Item Value Trend

SELECT
    year,
    month,
    month_name,
    ROUND(SUM(item_total_value), 2) AS monthly_item_value
FROM report_order_item_performance
GROUP BY year, month, month_name
ORDER BY year, month;


-- 3. Top 10 Customer States by Total Item Value

SELECT
    customer_state,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(item_total_value), 2) AS total_item_value
FROM report_order_item_performance
GROUP BY customer_state
ORDER BY total_item_value DESC
LIMIT 10;


-- 4. Top 10 Customer States by Average Order Value

SELECT
    customer_state,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        SUM(item_total_value) / COUNT(DISTINCT order_id), 2
    ) AS average_order_value
FROM report_order_item_performance
GROUP BY customer_state
ORDER BY average_order_value DESC
LIMIT 10;


-- 5. Payment Method Performance

SELECT
    payment_type,
    COUNT(*) AS total_payment_records,
    ROUND(SUM(payment_value), 2) AS total_payment_value,
    ROUND(AVG(payment_value), 2) AS average_payment_value
FROM report_payment_performance
GROUP BY payment_type
ORDER BY total_payment_value DESC;


-- 6. Customer Review Score Distribution

SELECT
    review_score,
    COUNT(*) AS total_reviews,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM report_customer_reviews),
        2
    ) AS review_percentage
FROM report_customer_reviews
GROUP BY review_score
ORDER BY review_score DESC;


-- 7. Average Review Score by Product Category

SELECT
    COALESCE(
        NULLIF(p.product_category_name_english, ''),
        'Unknown'
    ) AS product_category,
    COUNT(*) AS total_reviews,
    ROUND(AVG(r.review_score), 2) AS average_review_score
FROM report_customer_reviews r
JOIN report_order_item_performance p
    ON r.order_id = p.order_id
GROUP BY product_category
ORDER BY average_review_score ASC;


-- 8. Negative Reviews by Product Category

SELECT
    COALESCE(
        NULLIF(p.product_category_name_english, ''),
        'Unknown'
    ) AS product_category,
    COUNT(*) AS total_reviews,
    SUM(CASE WHEN r.review_score = 1 THEN 1 ELSE 0 END) AS one_star_reviews,
    SUM(CASE WHEN r.review_score = 2 THEN 1 ELSE 0 END) AS two_star_reviews,
    ROUND(
        SUM(CASE WHEN r.review_score IN (1, 2) THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS negative_review_percentage
FROM report_customer_reviews r
JOIN report_order_item_performance p
    ON r.order_id = p.order_id
GROUP BY product_category
ORDER BY negative_review_percentage DESC;



-- 9. Delivery Performance

SELECT
    CASE
        WHEN DATEDIFF(
            order_delivered_customer_date,
            order_estimated_delivery_date
        ) > 0 THEN 'Late Delivery'
        ELSE 'On-Time or Early'
    END AS delivery_status,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*)
         FROM stg_orders_delivery
         WHERE order_delivered_customer_date IS NOT NULL),
        2
    ) AS percentage
FROM stg_orders_delivery
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status;


-- 10. Top 10 Sellers by Total Item Value

SELECT
    seller_id,
    seller_city,
    seller_state,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(*) AS total_items,
    ROUND(SUM(item_total_value), 2) AS total_item_value
FROM report_order_item_performance
GROUP BY seller_id, seller_city, seller_state
ORDER BY total_item_value DESC
LIMIT 10;


-- 11. Top 10 Customer Cities by Order Demand

SELECT
    customer_city,
    customer_state,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(item_total_value), 2) AS total_item_value
FROM report_order_item_performance
GROUP BY customer_city, customer_state
ORDER BY total_orders DESC
LIMIT 10;



-- 12. Order Status Distribution

SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM stg_order_status),
        2
    ) AS order_percentage
FROM stg_order_status
GROUP BY order_status
ORDER BY total_orders DESC;


-- 13. Freight Cost vs Product Value

SELECT
    ROUND(SUM(freight_value), 2) AS total_freight_value,
    ROUND(SUM(price), 2) AS total_product_value,
    ROUND(SUM(item_total_value), 2) AS total_item_value,
    ROUND(
        SUM(freight_value) * 100.0 / SUM(item_total_value),
        2
    ) AS freight_percentage
FROM report_order_item_performance;


-- 14. Average Review Score by Delivery Status

SELECT
    CASE
        WHEN d.order_delivered_customer_date IS NULL
            THEN 'Not Delivered / Missing Date'
        WHEN DATEDIFF(
            d.order_delivered_customer_date,
            d.order_estimated_delivery_date
        ) > 0
            THEN 'Late Delivery'
        ELSE 'On-Time or Early'
    END AS delivery_status,
    COUNT(*) AS total_reviews,
    ROUND(AVG(r.review_score), 2) AS average_review_score
FROM dw_factreviews r
JOIN stg_orders_delivery d
    ON r.order_id = d.order_id
GROUP BY delivery_status
ORDER BY average_review_score DESC;

