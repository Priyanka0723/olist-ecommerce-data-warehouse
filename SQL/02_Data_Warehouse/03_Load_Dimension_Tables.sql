
-- =====================================================
-- Olist Brazilian E-Commerce Data Warehouse
-- Script: Load Dimension Tables
-- Database: olistdatawarehouse
-- =====================================================

USE olistdatawarehouse;

-- 1. Load Customer Dimension
INSERT INTO dw_dimcustomer
SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM stg_dimcustomer;


-- 2. Load Product Dimension
INSERT INTO dw_dimproduct (
    product_id,
    product_category_name,
    product_category_name_english,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
)
SELECT
    product_id,
    product_category_name,
    product_category_name_english,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM stg_dimproduct;


-- 3. Load Seller Dimension
INSERT INTO dw_dimseller (
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
)
SELECT
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
FROM stg_dimseller;


-- 4. Load Date Dimension
INSERT INTO dw_dimdate (
    date_key,
    date_value,
    `year`,
    quarter,
    `month`,
    month_name,
    year_month,
    `day`,
    day_of_week,
    day_name,
    is_weekend
)
SELECT
    date_key,
    date_value,
    `year`,
    quarter,
    `month`,
    month_name,
    year_month,
    `day`,
    day_of_week,
    day_name,
    is_weekend
FROM stg_dimdate;


-- 5. Load Payment Type Dimension
INSERT INTO dw_dimpaymenttype (
    payment_type_key,
    payment_type
)
SELECT
    payment_type_key,
    payment_type
FROM stg_dimpaymenttype;
