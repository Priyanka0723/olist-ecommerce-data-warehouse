-- =====================================================
-- Olist Brazilian E-Commerce Data Warehouse
-- Script: Load CSV Files into Staging Tables
-- Database: olistdatawarehouse
-- =====================================================

USE olistdatawarehouse;

-- Enable local file loading if required
SET GLOBAL local_infile = 1;

-- 1. Load Customer Dimension
LOAD DATA LOCAL INFILE
'C:/Users/priya/OneDrive/Desktop/Documents/Downloads/Olist_Data_Warehouse/Dataset/Transformed/DimCustomer.csv'
INTO TABLE stg_dimcustomer
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 2. Load Product Dimension
LOAD DATA LOCAL INFILE
'C:/Users/priya/OneDrive/Desktop/Documents/Downloads/Olist_Data_Warehouse/Dataset/Transformed/DimProduct.csv'
INTO TABLE stg_dimproduct
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 3. Load Seller Dimension
LOAD DATA LOCAL INFILE
'C:/Users/priya/OneDrive/Desktop/Documents/Downloads/Olist_Data_Warehouse/Dataset/Transformed/DimSeller.csv'
INTO TABLE stg_dimseller
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 4. Load Date Dimension
LOAD DATA LOCAL INFILE
'C:/Users/priya/OneDrive/Desktop/Documents/Downloads/Olist_Data_Warehouse/Dataset/Transformed/DimDate.csv'
INTO TABLE stg_dimdate
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 5. Load Payment Type Dimension
LOAD DATA LOCAL INFILE
'C:/Users/priya/OneDrive/Desktop/Documents/Downloads/Olist_Data_Warehouse/Dataset/Transformed/DimPaymentType.csv'
INTO TABLE stg_dimpaymenttype
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 6. Load Order Items Fact
LOAD DATA LOCAL INFILE
'C:/Users/priya/OneDrive/Desktop/Documents/Downloads/Olist_Data_Warehouse/Dataset/Transformed/FactOrderItems.csv'
INTO TABLE stg_factorderitems
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 7. Load Payments Fact
LOAD DATA LOCAL INFILE
'C:/Users/priya/OneDrive/Desktop/Documents/Downloads/Olist_Data_Warehouse/Dataset/Transformed/FactPayments.csv'
INTO TABLE stg_factpayments
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 8. Load Reviews Fact
-- Note: The MySQL-compatible file handles newline characters
-- inside review comments.
LOAD DATA LOCAL INFILE
'C:/Users/priya/OneDrive/Desktop/Documents/Downloads/Olist_Data_Warehouse/Dataset/Transformed/FactReviews_MySQL.csv'
INTO TABLE stg_factreviews
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;