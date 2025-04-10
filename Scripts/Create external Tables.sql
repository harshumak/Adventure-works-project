CREATE DATABASE SCOPED CREDENTIAL cred_harsh
WITH
    IDENTITY = 'Managed Identity'


CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://awstorageharshumak.blob.core.windows.net/silver',
    CREDENTIAL = cred_harsh
)


CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://awstorageharshumak.blob.core.windows.net/gold',
    CREDENTIAL = cred_harsh
)


CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)


----------------------------------
-- Create External Table extsales
----------------------------------

CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
as 
SELECT * FROM gold.sales


------------------------------------
-- Create External Table extproducts
------------------------------------

CREATE EXTERNAL TABLE gold.extproducts
WITH
(
    LOCATION = 'extproducts',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
as 
SELECT * FROM gold.products


----------------------------------
-- Create External Table extsubcat
----------------------------------

CREATE EXTERNAL TABLE gold.extsubcat
WITH
(
    LOCATION = 'extsubcat',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
as 
SELECT * FROM gold.subcat


------------------------------------
-- Create External Table extcalendar
------------------------------------

CREATE EXTERNAL TABLE gold.extcalendar
WITH
(
    LOCATION = 'extcalendar',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
as 
SELECT * FROM gold.calendar


-------------------------------------
-- Create External Table extcustomers
-------------------------------------

CREATE EXTERNAL TABLE gold.extcustomers
WITH
(
    LOCATION = 'extcustomers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
as 
SELECT * FROM gold.customers


-----------------------------------
-- Create External Table extreturns
-----------------------------------

CREATE EXTERNAL TABLE gold.extreturns
WITH
(
    LOCATION = 'extreturns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
as 
SELECT * FROM gold.returns


---------------------------------------
-- Create External Table extterritories
---------------------------------------

CREATE EXTERNAL TABLE gold.extterritories
WITH
(
    LOCATION = 'extterritories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
as 
SELECT * FROM gold.territories


---------------------------------------
-- Create External Table extproductcategories
---------------------------------------

CREATE EXTERNAL TABLE gold.extproductcategories
WITH
(
    LOCATION = 'extproductcategories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
as 
SELECT * FROM gold.productcategory
















