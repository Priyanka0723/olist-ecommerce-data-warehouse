-- =====================================================
-- Olist Brazilian E-Commerce Data Warehouse
-- Script: Create Staging Tables
-- Database: olistdatawarehouse
-- =====================================================

USE olistdatawarehouse;

-- 1. Customer Dimension Staging
CREATE TABLE stg_dimcustomer (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix VARCHAR(10),
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

-- 2. Product Dimension Staging
CREATE TABLE stg_dimproduct (
    product_id VARCHAR(50),
    product_category_name VARCHAR(150),
    product_category_name_english VARCHAR(150),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g DECIMAL(12,2),
    product_length_cm DECIMAL(12,2),
    product_height_cm DECIMAL(12,2),
    product_width_cm DECIMAL(12,2)
);

-- 3. Seller Dimension Staging
CREATE TABLE stg_dimseller (
    seller_id VARCHAR(50),
    seller_zip_code_prefix VARCHAR(10),
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);

-- 4. Date Dimension Staging
CREATE TABLE stg_dimdate (
    date_key INT,
    date_value DATE,
    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20),
    year_month VARCHAR(10),
    day INT,
    day_of_week INT,
    day_name VARCHAR(20),
    is_weekend BOOLEAN
);

-- 5. Payment Type Dimension Staging
CREATE TABLE stg_dimpaymenttype (
    payment_type_key INT,
    payment_type VARCHAR(30)
);

-- 6. Order Items Fact Staging
CREATE TABLE stg_factorderitems (
    order_id VARCHAR(50),
    order_item_id INT,
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    date_key INT,
    price DECIMAL(12,2),
    freight_value DECIMAL(12,2),
    item_total_value DECIMAL(12,2)
);

-- 7. Payments Fact Staging
CREATE TABLE stg_factpayments (
    order_id VARCHAR(50),
    payment_sequential INT,
    customer_id VARCHAR(50),
    payment_type_key INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(12,2),
    purchase_date_key INT
);

-- 8. Reviews Fact Staging
CREATE TABLE stg_factreviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME,
    customer_id VARCHAR(50),
    purchase_date_key INT,
    review_creation_date_key INT,
    review_answer_date_key INT
);