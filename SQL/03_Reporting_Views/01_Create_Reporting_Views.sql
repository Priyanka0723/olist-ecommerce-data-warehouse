
USE olistdatawarehouse;

-- 1. Order Item Performance View
CREATE VIEW report_order_item_performance AS
SELECT
    f.order_id,
    f.order_item_id,
    d.date_value AS order_date,
    d.year,
    d.month,
    d.month_name,
    c.customer_id,
    c.customer_city,
    c.customer_state,
    p.product_id,
    p.product_category_name_english,
    s.seller_id,
    s.seller_city AS seller_city,
    s.seller_state AS seller_state,
    f.price,
    f.freight_value,
    f.item_total_value
FROM dw_factorderitems f
LEFT JOIN dw_dimcustomer c
    ON f.customer_id = c.customer_id
LEFT JOIN dw_dimproduct p
    ON f.product_id = p.product_id
LEFT JOIN dw_dimseller s
    ON f.seller_id = s.seller_id
LEFT JOIN dw_dimdate d
    ON f.date_key = d.date_key;


-- 2. Payment Performance View
CREATE VIEW report_payment_performance AS
SELECT
    f.order_id,
    f.payment_sequential,
    c.customer_id,
    c.customer_city,
    c.customer_state,
    d.date_value AS purchase_date,
    d.year,
    d.month,
    f.payment_type,
    f.payment_installments,
    f.payment_value
FROM dw_factpayments f
LEFT JOIN dw_dimcustomer c
    ON f.customer_id = c.customer_id
LEFT JOIN dw_dimdate d
    ON f.purchase_date_key = d.date_key;


-- 3. Customer Reviews View
CREATE VIEW report_customer_reviews AS
SELECT
    f.review_id,
    f.order_id,
    f.review_score,
    f.review_comment_title,
    f.review_comment_message,
    c.customer_id,
    c.customer_city,
    c.customer_state,
    dp.date_value AS purchase_date,
    dc.date_value AS review_creation_date,
    da.date_value AS review_answer_date
FROM dw_factreviews f
LEFT JOIN dw_dimcustomer c
    ON f.customer_id = c.customer_id
LEFT JOIN dw_dimdate dp
    ON f.purchase_date_key = dp.date_key
LEFT JOIN dw_dimdate dc
    ON f.review_creation_date_key = dc.date_key
LEFT JOIN dw_dimdate da
    ON f.review_answer_date_key = da.date_key;
