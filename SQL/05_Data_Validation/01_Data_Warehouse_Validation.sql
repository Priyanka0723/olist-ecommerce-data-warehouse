
USE olistdatawarehouse;

-- 1. Validate Row Counts Across All DW Tables

SELECT 'dw_dimcustomer' AS table_name, COUNT(*) AS total_rows
FROM dw_dimcustomer
UNION ALL
SELECT 'dw_dimproduct', COUNT(*) FROM dw_dimproduct
UNION ALL
SELECT 'dw_dimseller', COUNT(*) FROM dw_dimseller
UNION ALL
SELECT 'dw_dimdate', COUNT(*) FROM dw_dimdate
UNION ALL
SELECT 'dw_dimpaymenttype', COUNT(*) FROM dw_dimpaymenttype
UNION ALL
SELECT 'dw_factorderitems', COUNT(*) FROM dw_factorderitems
UNION ALL
SELECT 'dw_factpayments', COUNT(*) FROM dw_factpayments
UNION ALL
SELECT 'dw_factreviews', COUNT(*) FROM dw_factreviews;


-- 2. Validate Fact Table Primary Keys

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT(order_id, '-', order_item_id))
        AS unique_records
FROM dw_factorderitems;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT(order_id, '-', payment_sequential))
        AS unique_records
FROM dw_factpayments;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT(review_id, '-', order_id))
        AS unique_records
FROM dw_factreviews;


-- 3. Check for Unmatched Customer References

SELECT COUNT(*) AS unmatched_customers
FROM dw_factorderitems f
LEFT JOIN dw_dimcustomer d
    ON f.customer_id = d.customer_id
WHERE d.customer_id IS NULL;


-- 4. Validate Reporting View Row Counts

SELECT 'report_order_item_performance' AS view_name,
       COUNT(*) AS total_rows
FROM report_order_item_performance
UNION ALL
SELECT 'report_payment_performance', COUNT(*)
FROM report_payment_performance
UNION ALL
SELECT 'report_customer_reviews', COUNT(*)
FROM report_customer_reviews;
