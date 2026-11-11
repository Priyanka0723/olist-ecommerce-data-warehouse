
USE olistdatawarehouse;

-- 1. Load Fact Order Items
INSERT INTO dw_factorderitems (
    order_id,
    order_item_id,
    customer_id,
    product_id,
    seller_id,
    date_key,
    price,
    freight_value,
    item_total_value
)
SELECT
    order_id,
    order_item_id,
    customer_id,
    product_id,
    seller_id,
    date_key,
    price,
    freight_value,
    item_total_value
FROM stg_factorderitems;


-- 2. Load Fact Payments
INSERT INTO dw_factpayments (
    order_id,
    payment_sequential,
    payment_type_key,
    payment_type,
    payment_installments,
    payment_value,
    customer_id,
    purchase_date_key
)
SELECT
    order_id,
    payment_sequential,
    payment_type_key,
    payment_type,
    payment_installments,
    payment_value,
    customer_id,
    purchase_date_key
FROM stg_factpayments;


-- 3. Load Fact Reviews
INSERT INTO dw_factreviews (
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp,
    customer_id,
    purchase_date_key,
    review_creation_date_key,
    review_answer_date_key
)
SELECT
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    CASE
        WHEN review_answer_timestamp = '0000-00-00 00:00:00'
        THEN NULL
        ELSE review_answer_timestamp
    END,
    customer_id,
    purchase_date_key,
    review_creation_date_key,
    review_answer_date_key
FROM stg_factreviews;
