-- =====================================================
-- Olist Data Warehouse
-- Script: Delivery Analysis Staging Tables
-- =====================================================

USE olistdatawarehouse;

-- 1. Store actual and estimated delivery dates
CREATE TABLE stg_orders_delivery (
    order_id VARCHAR(50) NOT NULL,
    order_delivered_customer_date DATETIME NULL,
    order_estimated_delivery_date DATETIME NULL,
    PRIMARY KEY (order_id)
);

-- 2. Store order status
CREATE TABLE stg_order_status (
    order_id VARCHAR(50) NOT NULL,
    order_status VARCHAR(30),
    PRIMARY KEY (order_id)
);