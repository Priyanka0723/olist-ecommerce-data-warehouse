-- =====================================================
-- Olist Brazilian E-Commerce Data Warehouse
-- Script: Create Fact Tables
-- Database: olistdatawarehouse
-- =====================================================

USE olistdatawarehouse;

-- 1. Fact Order Items
CREATE TABLE dw_factorderitems (
    order_id VARCHAR(50) NOT NULL,
    order_item_id INT NOT NULL,
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    date_key INT,
    price DECIMAL(12,2),
    freight_value DECIMAL(12,2),
    item_total_value DECIMAL(12,2),

    PRIMARY KEY (order_id, order_item_id),

    FOREIGN KEY (customer_id)
        REFERENCES dw_dimcustomer(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES dw_dimproduct(product_id),

    FOREIGN KEY (seller_id)
        REFERENCES dw_dimseller(seller_id),

    FOREIGN KEY (date_key)
        REFERENCES dw_dimdate(date_key)
);

-- 2. Fact Payments
CREATE TABLE dw_factpayments (
    order_id VARCHAR(50) NOT NULL,
    payment_sequential INT NOT NULL,
    customer_id VARCHAR(50),
    payment_type_key INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(12,2),
    purchase_date_key INT,

    PRIMARY KEY (order_id, payment_sequential),

    FOREIGN KEY (customer_id)
        REFERENCES dw_dimcustomer(customer_id),

    FOREIGN KEY (payment_type_key)
        REFERENCES dw_dimpaymenttype(payment_type_key),

    FOREIGN KEY (purchase_date_key)
        REFERENCES dw_dimdate(date_key)
);

-- 3. Fact Reviews
CREATE TABLE dw_factreviews (
    review_id VARCHAR(50) NOT NULL,
    order_id VARCHAR(50) NOT NULL,
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME,
    customer_id VARCHAR(50),
    purchase_date_key INT,
    review_creation_date_key INT,
    review_answer_date_key INT,

    PRIMARY KEY (review_id, order_id),

    FOREIGN KEY (customer_id)
        REFERENCES dw_dimcustomer(customer_id),

    FOREIGN KEY (purchase_date_key)
        REFERENCES dw_dimdate(date_key),

    FOREIGN KEY (review_creation_date_key)
        REFERENCES dw_dimdate(date_key),

    FOREIGN KEY (review_answer_date_key)
        REFERENCES dw_dimdate(date_key)
);