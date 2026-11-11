-- =====================================================
-- Olist Brazilian E-Commerce Data Warehouse
-- Script: Create Dimension Tables
-- Database: olistdatawarehouse
-- =====================================================

USE olistdatawarehouse;

-- 1. Customer Dimension
CREATE TABLE dw_dimcustomer (
    customer_id VARCHAR(50) NOT NULL,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix VARCHAR(10),
    customer_city VARCHAR(100),
    customer_state VARCHAR(10),
    PRIMARY KEY (customer_id)
);

-- 2. Product Dimension
CREATE TABLE dw_dimproduct (
    product_id VARCHAR(50) NOT NULL,
    product_category_name VARCHAR(150),
    product_category_name_english VARCHAR(150),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g DECIMAL(12,2),
    product_length_cm DECIMAL(12,2),
    product_height_cm DECIMAL(12,2),
    product_width_cm DECIMAL(12,2),
    PRIMARY KEY (product_id)
);

-- 3. Seller Dimension
CREATE TABLE dw_dimseller (
    seller_id VARCHAR(50) NOT NULL,
    seller_zip_code_prefix VARCHAR(10),
    seller_city VARCHAR(100),
    seller_state VARCHAR(10),
    PRIMARY KEY (seller_id)
);

-- 4. Date Dimension
CREATE TABLE dw_dimdate (
    date_key INT NOT NULL,
    date_value DATE,
    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20),
    year_month VARCHAR(10),
    day INT,
    day_of_week INT,
    day_name VARCHAR(20),
    is_weekend BOOLEAN,
    PRIMARY KEY (date_key)
);

-- 5. Payment Type Dimension
CREATE TABLE dw_dimpaymenttype (
    payment_type_key INT NOT NULL,
    payment_type VARCHAR(30),
    PRIMARY KEY (payment_type_key)
);