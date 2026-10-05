CREATE DATABASE SupplyChainFinanceManagement;
USE SupplyChainFinanceManagement;

-- 1. Customer Table
CREATE TABLE dim_customer
(
    customer_code INT,
    customer VARCHAR(150),
    platform VARCHAR(45),
    channel VARCHAR(45),
    market VARCHAR(45),
    sub_zone VARCHAR(45),
    region VARCHAR(45)
);
GO


-- 2. Product Table
CREATE TABLE dim_product
(
    product_code VARCHAR(45),
    division VARCHAR(45),
    segment VARCHAR(45),
    category VARCHAR(45),
    product VARCHAR(200),
    variant VARCHAR(45)
);
GO


-- 3. Forecast Monthly Table
CREATE TABLE fact_forecast_monthly
(
    date DATE,
    fiscal_year INT,
    product_code VARCHAR(45),
    customer_code INT,
    forecast_quantity INT,
    dim_customer_customer_code INT,
    dim_product_product_code VARCHAR(45)
);
GO


-- 4. Freight Cost Table
CREATE TABLE fact_freight_cost
(
    market VARCHAR(45),
    fiscal_year INT,
    freight_pct DECIMAL(5,4),
    other_cost_pct DECIMAL(5,4)
);
GO


-- 5. Gross Price Table
CREATE TABLE fact_gross_price
(
    product_code VARCHAR(45),
    fiscal_year INT,
    gross_price DECIMAL(15,4),
    dim_product_product_code VARCHAR(45)
);
GO


-- 6. Manufacturing Cost Table
CREATE TABLE fact_manufacturing_cost
(
    product_code VARCHAR(45),
    cost_year INT,
    manufacturing_cost DECIMAL(15,4),
    dim_product_product_code VARCHAR(45)
);
GO


-- 7. Post Invoice Deductions Table
CREATE TABLE fact_post_invoice_deductions
(
    customer_code INT,
    product_code VARCHAR(45),
    date DATE,
    discounts_pct DECIMAL(5,4),
    other_deductions_pct DECIMAL(5,4)
);
GO


-- 8. Pre Invoice Deductions Table
CREATE TABLE fact_pre_invoice_deductions
(
    customer_code INT,
    fiscal_year INT,
    pre_invoice_discount_pct DECIMAL(5,4)
);
GO


-- 9. Sales Monthly Table
CREATE TABLE fact_sales_monthly
(
    date DATE,
    product_code VARCHAR(45),
    customer_code INT,
    sold_quantity INT,
    dim_customer_customer_code INT,
    fact_post_invoice_deductions_customer_code INT,
    fact_post_invoice_deductions_product_code VARCHAR(45),
    fact_post_invoice_deductions_date DATE,
    fact_pre_invoice_deductions_customer_code INT,
    fact_pre_invoice_deductions_fiscal_year INT
);
GO

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

USE SupplyChainFinanceManagement;
GO

INSERT INTO dim_customer
(customer_code, customer, platform, channel, market, sub_zone, region)
VALUES
(70020104, 'Atliq e Store', 'E-Commerce', 'Direct', 'Austria', 'NE', 'EU'),
(70021096, 'Atliq e Store', 'E-Commerce', 'Direct', 'United Kingdom', 'NE', 'EU'),
(70022084, 'Atliq Exclusive', 'Brick & Mortar', 'Direct', 'USA', 'NA', 'NA'),
(70022085, 'Atliq e Store', 'E-Commerce', 'Direct', 'USA', 'NA', 'NA'),
(70023031, 'Atliq Exclusive', 'Brick & Mortar', 'Direct', 'Canada', 'NA', 'NA'),
(70023032, 'Atliq e Store', 'E-Commerce', 'Direct', 'Canada', 'NA', 'NA'),
(70026206, 'Atliq e Store', 'E-Commerce', 'Direct', 'Mexico', 'LATAM', 'LATAM'),
(70027208, 'Atliq e Store', 'E-Commerce', 'Direct', 'Brazil', 'LATAM', 'LATAM'),
(80001019, 'Neptune', 'Brick & Mortar', 'Distributor', 'China', 'ROA', 'APAC'),
(8006154, 'Synthetic', 'Brick & Mortar', 'Distributor', 'Philippines', 'ROA', 'APAC'),
(8006155, 'Novus', 'Brick & Mortar', 'Distributor', 'Philippines', 'ROA', 'APAC');


INSERT INTO dim_product
(product_code, division, segment, category, product, variant)
VALUES
('A1919150403', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito', 'Plus 2'),
('A1920150404', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito', 'Premium'),
('A2020150501', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito 2', 'Standard'),
('A2020150502', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito 2', 'Plus 1'),
('A2021150503', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito 2', 'Plus 2'),
('A2021150504', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito 2', 'Premium'),
('A2118150101', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Standard 1'),
('A2118150102', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Standard 2'),
('A2118150103', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Plus 1'),
('A2118150104', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Plus 2'),
('A2118150105', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Premium 1');

SELECT *
FROM dim_product;


INSERT INTO fact_forecast_monthly
(date, fiscal_year, product_code, customer_code, forecast_quantity)
VALUES
('2017-09-01', 2018, 'A0118150101', 70002017, 18),
('2017-09-01', 2018, 'A0118150101', 70002018, 11),
('2017-09-01', 2018, 'A0118150101', 70003181, 9),
('2017-09-01', 2018, 'A0118150101', 70003182, 6),
('2017-09-01', 2018, 'A0118150101', 70006157, 5),
('2017-09-01', 2018, 'A0118150101', 70006158, 6),
('2017-09-01', 2018, 'A0118150101', 70007198, 4),
('2017-09-01', 2018, 'A0118150101', 70007199, 7),
('2017-09-01', 2018, 'A0118150101', 70008169, 7),
('2017-09-01', 2018, 'A0118150101', 70008170, 8),
('2017-09-01', 2018, 'A0118150101', 70011193, 5);


INSERT INTO fact_forecast_monthly
(date, fiscal_year, product_code, customer_code, forecast_quantity)
VALUES
('2017-09-01', 2018, 'A0118150101', 70002017, 18),
('2017-09-01', 2018, 'A0118150101', 70002018, 11),
('2017-09-01', 2018, 'A0118150101', 70003181, 9),
('2017-09-01', 2018, 'A0118150101', 70003182, 6),
('2017-09-01', 2018, 'A0118150101', 70006157, 5),
('2017-09-01', 2018, 'A0118150101', 70006158, 6),
('2017-09-01', 2018, 'A0118150101', 70007198, 4),
('2017-09-01', 2018, 'A0118150101', 70007199, 7),
('2017-09-01', 2018, 'A0118150101', 70008169, 7),
('2017-09-01', 2018, 'A0118150101', 70008170, 8),
('2017-09-01', 2018, 'A0118150101', 70011193, 5);


SELECT *
FROM fact_forecast_monthly;



INSERT INTO fact_freight_cost
(market, fiscal_year, freight_pct, other_cost_pct)
VALUES
('Germany', 2020, 0.0226, 0.0060),
('Germany', 2021, 0.0226, 0.0060),
('Germany', 2022, 0.0226, 0.0060),
('India', 2018, 0.0244, 0.0026),
('India', 2019, 0.0219, 0.0057),
('India', 2020, 0.0309, 0.0029),
('India', 2021, 0.0309, 0.0029),
('India', 2022, 0.0309, 0.0029),
('Indonesia', 2018, 0.0190, 0.0042),
('Indonesia', 2019, 0.0187, 0.0052),
('Indonesia', 2020, 0.0195, 0.0023);

SELECT *
FROM fact_freight_cost;


INSERT INTO fact_gross_price
(product_code, fiscal_year, gross_price)
VALUES
('A0118150101', 2018, 15.3952),
('A0118150101', 2019, 14.4392),
('A0118150101', 2020, 16.2323),
('A0118150101', 2021, 19.0573),
('A0118150102', 2018, 19.5875),
('A0118150102', 2019, 18.5595),
('A0118150102', 2020, 19.8577),
('A0118150102', 2021, 21.4565),
('A0118150103', 2018, 19.3630),
('A0118150103', 2019, 19.3442),
('A0118150103', 2020, 22.1317);

SELECT *
FROM fact_gross_price;


INSERT INTO fact_manufacturing_cost
(product_code, cost_year, manufacturing_cost)
VALUES
('A0118150101', 2018, 10.7854),
('A0118150101', 2019, 10.7854),
('A0118150101', 2020, 10.7854),
('A0118150101', 2021, 10.7854),
('A0118150102', 2018, 11.2665),
('A0118150102', 2019, 11.2665),
('A0118150102', 2020, 11.2665),
('A0118150102', 2021, 11.2665),
('A0118150103', 2018, 11.2665),
('A0118150103', 2019, 11.2665),
('A0118150103', 2020, 11.2665);

SELECT *
FROM fact_manufacturing_cost;

INSERT INTO fact_post_invoice_deductions
(customer_code, product_code, date, discounts_pct, other_deductions_pct)
VALUES
(70002017, 'A0118150101', '2017-09-01', 0.2660, 0.0719),
(70002017, 'A0118150101', '2017-10-01', 0.3090, 0.0976),
(70002017, 'A0118150101', '2017-11-01', 0.3313, 0.0752),
(70002017, 'A0118150101', '2018-02-01', 0.2958, 0.0720),
(70002017, 'A0118150101', '2018-02-01', 0.3208, 0.0793),
(70002017, 'A0118150101', '2018-03-01', 0.2635, 0.1007),
(70002017, 'A0118150101', '2018-05-01', 0.2231, 0.0820),
(70002017, 'A0118150101', '2018-06-01', 0.3020, 0.0791),
(70002017, 'A0118150101', '2018-07-01', 0.3123, 0.0929),
(70002017, 'A0118150101', '2018-09-01', 0.1530, 0.1288),
(70002017, 'A0118150101', '2018-10-01', 0.1363, 0.1542);


INSERT INTO fact_pre_invoice_deductions
(customer_code, fiscal_year, pre_invoice_discount_pct)
VALUES
(70002017, 2018, 0.0824),
(70002017, 2019, 0.0777),
(70002017, 2020, 0.0735),
(70002017, 2021, 0.0703),
(70002017, 2022, 0.1057),
(70002018, 2018, 0.2956),
(70002018, 2019, 0.2577),
(70002018, 2020, 0.2255),
(70002018, 2021, 0.2061),
(70002018, 2022, 0.2931),
(70003181, 2018, 0.0536);

SELECT *
FROM fact_pre_invoice_deductions;


INSERT INTO fact_sales_monthly
(date, product_code, customer_code, sold_quantity)
VALUES
('2017-09-01', 'A0118150101', 70002017, 51),
('2017-09-01', 'A0118150101', 70002018, 77),
('2017-09-01', 'A0118150101', 70003181, 17),
('2017-09-01', 'A0118150101', 70003182, 6),
('2017-09-01', 'A0118150101', 70006157, 5),
('2017-09-01', 'A0118150101', 70006158, 7),
('2017-09-01', 'A0118150101', 70007198, 29),
('2017-09-01', 'A0118150101', 70007199, 34),
('2017-09-01', 'A0118150101', 70008169, 22),
('2017-09-01', 'A0118150101', 70008170, 5),
('2017-09-01', 'A0118150101', 70011193, 10);

SELECT *
FROM fact_sales_monthly;

SELECT 
    '2023-07-15' AS calendar_date,
    YEAR(DATEADD(MONTH, 4, '2023-07-15')) AS fiscal_year;

	SELECT
    s.date,
    s.product_code,
    p.product,
    p.variant,
    s.sold_quantity,
    gp.gross_price,
    s.sold_quantity * gp.gross_price AS gross_price_total
FROM fact_sales_monthly AS s
JOIN dim_product AS p
    ON s.product_code = p.product_code
JOIN fact_gross_price AS gp
    ON s.product_code = gp.product_code
    AND YEAR(DATEADD(MONTH, 4, s.date)) = gp.fiscal_year;

SELECT
    product_code,
    date,
    SUM(sold_quantity) AS total_sales_quantity
FROM fact_sales_monthly
GROUP BY
    product_code,
    date
ORDER BY
    product_code,
    date;


	SELECT
    c.channel,
    COUNT(DISTINCT c.customer_code) AS total_customers,
    SUM(s.sold_quantity) AS total_sales_quantity
FROM dim_customer AS c
JOIN fact_sales_monthly AS s
    ON c.customer_code = s.customer_code
GROUP BY
    c.channel
ORDER BY
    total_sales_quantity DESC;



	USE SupplyChainFinanceManagement;
GO

SELECT
    s.product_code,
    p.product,
    SUM(s.sold_quantity) AS total_sales_quantity,
    SUM(s.sold_quantity * gp.gross_price) AS total_revenue
FROM fact_sales_monthly AS s
JOIN dim_product AS p
    ON s.product_code = p.product_code
JOIN fact_gross_price AS gp
    ON s.product_code = gp.product_code
    AND YEAR(DATEADD(MONTH, 4, s.date)) = gp.fiscal_year
GROUP BY
    s.product_code,
    p.product
ORDER BY
    total_revenue DESC;



SELECT
    c.market,
    SUM(f.forecast_quantity) AS total_forecast_quantity
FROM fact_forecast_monthly AS f
JOIN dim_customer AS c
    ON f.customer_code = c.customer_code
GROUP BY
    c.market
ORDER BY
    total_forecast_quantity DESC;

	SELECT
    m.product_code,
    p.product,
    m.cost_year,
    m.manufacturing_cost,
    gp.gross_price,
    gp.gross_price - m.manufacturing_cost AS profit,
    ((gp.gross_price - m.manufacturing_cost) / gp.gross_price) * 100 AS profit_margin_percentage
FROM fact_manufacturing_cost AS m
JOIN dim_product AS p
    ON m.product_code = p.product_code
JOIN fact_gross_price AS gp
    ON m.product_code = gp.product_code
    AND m.cost_year = gp.fiscal_year
ORDER BY
    profit_margin_percentage DESC;



	SELECT
    d.customer_code,
    d.fiscal_year,
    d.pre_invoice_discount_pct,
    SUM(s.sold_quantity) AS total_sales_quantity
FROM fact_pre_invoice_deductions AS d
JOIN fact_sales_monthly AS s
    ON d.customer_code = s.customer_code
    AND d.fiscal_year = YEAR(DATEADD(MONTH, 4, s.date))
GROUP BY
    d.customer_code,
    d.fiscal_year,
    d.pre_invoice_discount_pct
ORDER BY
    d.pre_invoice_discount_pct DESC;


SELECT
    market,
    fiscal_year,
    AVG(freight_pct) AS average_freight_cost,
    AVG(other_cost_pct) AS average_other_cost
FROM fact_freight_cost
GROUP BY
    market,
    fiscal_year
ORDER BY
    market,
    fiscal_year;


	USE SupplyChainFinanceManagement;
GO

/* =====================================================
   TASK 4 - Q8: Seasonal Sales Patterns
   ===================================================== */

SELECT
    MONTH(date) AS sales_month,
    SUM(sold_quantity) AS total_sales_quantity
FROM fact_sales_monthly
GROUP BY MONTH(date)
ORDER BY sales_month;


/* =====================================================
   TASK 4 - Q9: Customer Loyalty Analysis
   ===================================================== */

SELECT
    customer_code,
    COUNT(DISTINCT date) AS purchase_frequency,
    SUM(sold_quantity) AS total_purchase_quantity
FROM fact_sales_monthly
GROUP BY customer_code
ORDER BY purchase_frequency DESC, total_purchase_quantity DESC;


/* =====================================================
   TASK 4 - Q10: Forecast Accuracy Evaluation
   ===================================================== */

SELECT
    f.product_code,
    f.date,
    f.fiscal_year,
    SUM(f.forecast_quantity) AS forecast_quantity,
    SUM(s.sold_quantity) AS actual_sold_quantity,
    (SUM(s.sold_quantity) * 100.0 /
        NULLIF(SUM(f.forecast_quantity), 0)) AS forecast_accuracy_percentage
FROM fact_forecast_monthly AS f
LEFT JOIN fact_sales_monthly AS s
    ON f.product_code = s.product_code
    AND f.customer_code = s.customer_code
    AND f.date = s.date
GROUP BY
    f.product_code,
    f.date,
    f.fiscal_year
ORDER BY
    f.product_code,
    f.date;


/* =====================================================
   TASK 4 - Q11: Channel Performance Assessment
   ===================================================== */

SELECT
    c.channel,
    SUM(s.sold_quantity) AS total_sales_quantity,
    COUNT(DISTINCT s.customer_code) AS total_customers
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
    ON s.customer_code = c.customer_code
GROUP BY c.channel
ORDER BY total_sales_quantity DESC;


/* =====================================================
   TASK 4 - Q12: Geographical Sales Distribution
   ===================================================== */

SELECT
    c.region,
    SUM(s.sold_quantity) AS total_sales_quantity,
    COUNT(DISTINCT s.customer_code) AS total_customers
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
    ON s.customer_code = c.customer_code
GROUP BY c.region
ORDER BY total_sales_quantity DESC;


/* =====================================================
   TASK 4 - Q13: Customer Acquisition Cost Analysis
   ===================================================== */

SELECT
    c.market,
    c.channel,
    COUNT(DISTINCT c.customer_code) AS total_customers
FROM dim_customer AS c
GROUP BY
    c.market,
    c.channel
ORDER BY
    total_customers DESC;


/* =====================================================
   TASK 4 - Q14: Product Mix Optimization
   ===================================================== */

SELECT
    s.product_code,
    p.product,
    SUM(s.sold_quantity) AS total_sales_quantity,
    SUM(s.sold_quantity * gp.gross_price) AS total_revenue
FROM fact_sales_monthly AS s
JOIN dim_product AS p
    ON s.product_code = p.product_code
JOIN fact_gross_price AS gp
    ON s.product_code = gp.product_code
    AND YEAR(DATEADD(MONTH, 4, s.date)) = gp.fiscal_year
GROUP BY
    s.product_code,
    p.product
ORDER BY
    total_revenue DESC;


/* =====================================================
   TASK 4 - Q15: Customer Lifetime Value
   ===================================================== */

SELECT
    c.customer_code,
    c.customer,
    SUM(s.sold_quantity * gp.gross_price) AS estimated_lifetime_value
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
    ON s.customer_code = c.customer_code
JOIN fact_gross_price AS gp
    ON s.product_code = gp.product_code
    AND YEAR(DATEADD(MONTH, 4, s.date)) = gp.fiscal_year
GROUP BY
    c.customer_code,
    c.customer
ORDER BY
    estimated_lifetime_value DESC;


/* =====================================================
   TASK 4 - Q16: Inventory Management Analysis
   ===================================================== */

SELECT
    product_code,
    SUM(sold_quantity) AS total_sold_quantity,
    COUNT(DISTINCT date) AS months_sold
FROM fact_sales_monthly
GROUP BY product_code
ORDER BY total_sold_quantity ASC;


/* =====================================================
   TASK 4 - Q17: Competitor Benchmarking
   ===================================================== */

SELECT
    c.market,
    SUM(s.sold_quantity) AS company_sales_quantity
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
    ON s.customer_code = c.customer_code
GROUP BY c.market
ORDER BY company_sales_quantity DESC;


/* =====================================================
   TASK 4 - Q18: Price Elasticity Estimation
   ===================================================== */

SELECT
    s.product_code,
    YEAR(s.date) AS sales_year,
    AVG(gp.gross_price) AS average_price,
    SUM(s.sold_quantity) AS total_sales_quantity
FROM fact_sales_monthly AS s
JOIN fact_gross_price AS gp
    ON s.product_code = gp.product_code
    AND YEAR(DATEADD(MONTH, 4, s.date)) = gp.fiscal_year
GROUP BY
    s.product_code,
    YEAR(s.date)
ORDER BY
    s.product_code,
    sales_year;


/* =====================================================
   TASK 4 - Q19: Customer Satisfaction Analysis
   ===================================================== */

SELECT
    customer_code,
    COUNT(DISTINCT date) AS purchase_frequency,
    SUM(sold_quantity) AS total_sales_quantity
FROM fact_sales_monthly
GROUP BY customer_code
ORDER BY total_sales_quantity DESC;


/* =====================================================
   TASK 4 - Q20: Marketing Campaign Effectiveness
   ===================================================== */

SELECT
    c.channel,
    c.market,
    SUM(s.sold_quantity) AS total_sales_quantity,
    COUNT(DISTINCT s.customer_code) AS total_customers
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
    ON s.customer_code = c.customer_code
GROUP BY
    c.channel,
    c.market
ORDER BY
    total_sales_quantity DESC;

	--TASK 5 — ADVANCED SQL--

	--Q1. UDF – Total Forecasted Quantity
	CREATE FUNCTION fn_TotalForecastQuantity
(
    @product_code VARCHAR(45),
    @fiscal_year INT
)
RETURNS INT
AS
BEGIN
    DECLARE @total_quantity INT;

    SELECT @total_quantity = SUM(forecast_quantity)
    FROM fact_forecast_monthly
    WHERE product_code = @product_code
      AND fiscal_year = @fiscal_year;

    RETURN ISNULL(@total_quantity, 0);
END;
GO

SELECT dbo.fn_TotalForecastQuantity('A0118150101', 2018)
AS total_forecast_quantity;

--Q2. Customers Whose Purchases Exceed Average Monthly Sales

WITH CustomerMonthlySales AS
(
    SELECT
        customer_code,
        date,
        SUM(sold_quantity) AS monthly_sales
    FROM fact_sales_monthly
    GROUP BY customer_code, date
),
AverageMonthlySales AS
(
    SELECT AVG(monthly_sales) AS avg_monthly_sales
    FROM CustomerMonthlySales
)
SELECT
    customer_code,
    date,
    monthly_sales
FROM CustomerMonthlySales
WHERE monthly_sales >
      (SELECT avg_monthly_sales
       FROM AverageMonthlySales)
ORDER BY monthly_sales DESC;

--Q3. Stored Procedure – Update Gross Price
CREATE PROCEDURE sp_UpdateGrossPrice
(
    @product_code VARCHAR(45),
    @fiscal_year INT,
    @new_gross_price DECIMAL(15,4)
)
AS
BEGIN
    UPDATE fact_gross_price
    SET gross_price = @new_gross_price
    WHERE product_code = @product_code
      AND fiscal_year = @fiscal_year;
END;
GO

EXEC sp_UpdateGrossPrice
    'A0118150101',
    2018,
    20.50;

	--Q4. Trigger – Sales Audit Log
	CREATE TABLE sales_audit_log
(
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    product_code VARCHAR(45),
    customer_code INT,
    sale_date DATE,
    sold_quantity INT,
    audit_date DATETIME DEFAULT GETDATE()
);
GO

CREATE TRIGGER trg_SalesAudit
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    INSERT INTO sales_audit_log
    (
        product_code,
        customer_code,
        sale_date,
        sold_quantity
    )
    SELECT
        product_code,
        customer_code,
        date,
        sold_quantity
    FROM inserted;
END;
GO

--Q5. Rank Products Based on Monthly Sales Quantity
SELECT
    fiscal_year,
    product_code,
    sales_month,
    total_sales_quantity,
    RANK() OVER
    (
        PARTITION BY fiscal_year, sales_month
        ORDER BY total_sales_quantity DESC
    ) AS product_rank
FROM
(
    SELECT
        YEAR(DATEADD(MONTH, 4, date)) AS fiscal_year,
        MONTH(date) AS sales_month,
        product_code,
        SUM(sold_quantity) AS total_sales_quantity
    FROM fact_sales_monthly
    GROUP BY
        YEAR(DATEADD(MONTH, 4, date)),
        MONTH(date),
        product_code
) AS x
ORDER BY
    fiscal_year,
    sales_month,
    product_rank;

	--Q6. STRING_AGG – Customer Names for a Product
	SELECT
    s.product_code,
    STRING_AGG(c.customer, ', ') AS customer_names
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
    ON s.customer_code = c.customer_code
WHERE s.product_code = 'A0118150101'
  AND s.date BETWEEN '2017-09-01' AND '2018-08-31'
GROUP BY s.product_code;

--Q7. UDF – Total Manufacturing Cost
CREATE FUNCTION fn_TotalManufacturingCost
(
    @product_code VARCHAR(45),
    @start_year INT,
    @end_year INT
)
RETURNS DECIMAL(18,4)
AS
BEGIN
    DECLARE @total_cost DECIMAL(18,4);

    SELECT @total_cost =
    (
        SELECT SUM(manufacturing_cost)
        FROM fact_manufacturing_cost
        WHERE product_code = @product_code
          AND cost_year BETWEEN @start_year AND @end_year
    );

    RETURN ISNULL(@total_cost, 0);
END;
GO

SELECT dbo.fn_TotalManufacturingCost
(
    'A0118150101',
    2018,
    2021
) AS total_manufacturing_cost;

--Q8. Stored Procedure + Trigger – Inventory Check
CREATE TABLE product_inventory
(
    product_code VARCHAR(45) PRIMARY KEY,
    inventory_quantity INT
);
GO

INSERT INTO product_inventory
VALUES
('A0118150101', 100);
GO

CREATE TRIGGER trg_CheckInventory
ON fact_sales_monthly
INSTEAD OF INSERT
AS
BEGIN

    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        JOIN product_inventory p
            ON i.product_code = p.product_code
        WHERE i.sold_quantity > p.inventory_quantity
    )
    BEGIN
        RAISERROR('Sold quantity exceeds available inventory.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    INSERT INTO fact_sales_monthly
    (
        date,
        product_code,
        customer_code,
        sold_quantity
    )
    SELECT
        date,
        product_code,
        customer_code,
        sold_quantity
    FROM inserted;
END;
GO

CREATE PROCEDURE sp_InsertSale
(
    @date DATE,
    @product_code VARCHAR(45),
    @customer_code INT,
    @sold_quantity INT
)
AS
BEGIN
    INSERT INTO fact_sales_monthly
    (
        date,
        product_code,
        customer_code,
        sold_quantity
    )
    VALUES
    (
        @date,
        @product_code,
        @customer_code,
        @sold_quantity
    );
END;
GO

--Q9. LAG – Compare Monthly Sales with Previous Month
SELECT
    product_code,
    date,
    sold_quantity,
    LAG(sold_quantity) OVER
    (
        PARTITION BY product_code
        ORDER BY date
    ) AS previous_month_sales
FROM fact_sales_monthly
ORDER BY
    product_code,
    date;

	--Q10. Top-Selling Products in Each Market
	WITH MarketProductSales AS
(
    SELECT
        c.market,
        s.product_code,
        SUM(s.sold_quantity) AS total_sales_quantity
    FROM fact_sales_monthly AS s
    JOIN dim_customer AS c
        ON s.customer_code = c.customer_code
    GROUP BY
        c.market,
        s.product_code
),
RankedProducts AS
(
    SELECT
        market,
        product_code,
        total_sales_quantity,
        RANK() OVER
        (
            PARTITION BY market
            ORDER BY total_sales_quantity DESC
        ) AS product_rank
    FROM MarketProductSales
)
SELECT
    market,
    product_code,
    total_sales_quantity
FROM RankedProducts
WHERE product_rank = 1;

--Q10. Top-Selling Products in Each Market

WITH MarketProductSales AS
(
    SELECT
        c.market,
        s.product_code,
        SUM(s.sold_quantity) AS total_sales_quantity
    FROM fact_sales_monthly AS s
    JOIN dim_customer AS c
        ON s.customer_code = c.customer_code
    GROUP BY
        c.market,
        s.product_code
),
RankedProducts AS
(
    SELECT
        market,
        product_code,
        total_sales_quantity,
        RANK() OVER
        (
            PARTITION BY market
            ORDER BY total_sales_quantity DESC
        ) AS product_rank
    FROM MarketProductSales
)
SELECT
    market,
    product_code,
    total_sales_quantity
FROM RankedProducts
WHERE product_rank = 1;


--Q11. UDF – Total Freight Cost + Procedure
CREATE FUNCTION fn_TotalFreightCost
(
    @product_code VARCHAR(45),
    @market VARCHAR(45),
    @fiscal_year INT
)
RETURNS DECIMAL(18,4)
AS
BEGIN
    DECLARE @freight_cost DECIMAL(18,4);

    SELECT @freight_cost =
        ISNULL(gp.gross_price, 0) *
        ISNULL(fc.freight_pct, 0)
    FROM fact_gross_price gp
    JOIN fact_freight_cost fc
        ON gp.fiscal_year = fc.fiscal_year
    WHERE gp.product_code = @product_code
      AND gp.fiscal_year = @fiscal_year
      AND fc.market = @market;

    RETURN ISNULL(@freight_cost, 0);
END;
GO

CREATE PROCEDURE sp_CalculateOverallCost
(
    @product_code VARCHAR(45),
    @market VARCHAR(45),
    @fiscal_year INT
)
AS
BEGIN
    SELECT
        @product_code AS product_code,
        @market AS market,
        @fiscal_year AS fiscal_year,
        mc.manufacturing_cost,
        dbo.fn_TotalFreightCost
        (
            @product_code,
            @market,
            @fiscal_year
        ) AS freight_cost,
        mc.manufacturing_cost +
        dbo.fn_TotalFreightCost
        (
            @product_code,
            @market,
            @fiscal_year
        ) AS overall_cost
    FROM fact_manufacturing_cost mc
    WHERE mc.product_code = @product_code
      AND mc.cost_year = @fiscal_year;
END;
GO

EXEC sp_CalculateOverallCost
'A0118150101',
'India',
2018;

--Q12. Trigger – Update Inventory Count
CREATE TRIGGER trg_UpdateInventory
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.inventory_quantity =
        p.inventory_quantity - x.total_sold
    FROM product_inventory p
    JOIN
    (
        SELECT
            product_code,
            SUM(sold_quantity) AS total_sold
        FROM inserted
        GROUP BY product_code
    ) x
        ON p.product_code = x.product_code;
END;
GO

--Q13. Trigger – Product Referential Integrity
CREATE TRIGGER trg_CheckProductExists
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM dim_product p
            WHERE p.product_code = i.product_code
        )
    )
    BEGIN
        RAISERROR
        (
            'Product does not exist in dim_product.',
            16,
            1
        );

        ROLLBACK TRANSACTION;
    END;
END;
GO

--Q14. Stored Procedure – Month-over-Month Growth
CREATE PROCEDURE sp_MonthlySalesGrowth
AS
BEGIN

    WITH MonthlySales AS
    (
        SELECT
            product_code,
            date,
            SUM(sold_quantity) AS total_sales
        FROM fact_sales_monthly
        GROUP BY
            product_code,
            date
    ),
    SalesWithPrevious AS
    (
        SELECT
            product_code,
            date,
            total_sales,
            LAG(total_sales) OVER
            (
                PARTITION BY product_code
                ORDER BY date
            ) AS previous_sales
        FROM MonthlySales
    )

    SELECT
        product_code,
        date,
        total_sales,
        previous_sales,
        ((total_sales - previous_sales) * 100.0 /
            NULLIF(previous_sales, 0))
            AS growth_percentage
    FROM SalesWithPrevious
    ORDER BY product_code, date;

END;
GO

EXEC sp_MonthlySalesGrowth;

--Q15. UDF – Average Discount %
CREATE FUNCTION fn_AverageDiscount
(
    @product_code VARCHAR(45)
)
RETURNS DECIMAL(10,4)
AS
BEGIN
    DECLARE @avg_discount DECIMAL(10,4);

    SELECT @avg_discount =
        AVG(discounts_pct)
    FROM fact_post_invoice_deductions
    WHERE product_code = @product_code;

    RETURN ISNULL(@avg_discount, 0);
END;
GO

SELECT dbo.fn_AverageDiscount('A0118150101')
AS average_discount;

--Q16. Highest Total Purchases in Each Region
WITH CustomerRegionSales AS
(
    SELECT
        c.region,
        c.customer_code,
        c.customer,
        SUM(s.sold_quantity) AS total_purchases
    FROM fact_sales_monthly s
    JOIN dim_customer c
        ON s.customer_code = c.customer_code
    GROUP BY
        c.region,
        c.customer_code,
        c.customer
),
RankedCustomers AS
(
    SELECT
        *,
        RANK() OVER
        (
            PARTITION BY region
            ORDER BY total_purchases DESC
        ) AS customer_rank
    FROM CustomerRegionSales
)
SELECT
    region,
    customer_code,
    customer,
    total_purchases
FROM RankedCustomers
WHERE customer_rank = 1;

--Q17. Stored Procedure – Total Revenue for Period
CREATE PROCEDURE sp_TotalRevenue
(
    @start_date DATE,
    @end_date DATE
)
AS
BEGIN

    SELECT
        SUM(s.sold_quantity * gp.gross_price)
        AS total_revenue
    FROM fact_sales_monthly s
    JOIN fact_gross_price gp
        ON s.product_code = gp.product_code
        AND YEAR(DATEADD(MONTH, 4, s.date))
            = gp.fiscal_year
    WHERE s.date BETWEEN @start_date AND @end_date;

END;
GO

EXEC sp_TotalRevenue
'2017-09-01',
'2018-08-31';

--

Project-2(1).pdf
PDF
ANALIZE THIS PDF AND TELL MEE WHICH DATA SET IS NEEDE FOR THIS PROJECT YA ALREADY GIVEN IN THIS PROJECT

Screenshot 2026-10-05 113554.png

Haan. Ab Task 2 exactly PDF ke according karenge. Task 2 ka instruction hai: tables create karne ke baad given records ko respective tables me insert karna hai. 


But ek important baat: PDF me jo screenshots hain, unmein sirf sample records visible hain, complete dataset nahi. For example fact_sales_monthly me screenshot me 10 rows dikh rahi hain. 


Task 2 ka actual process
Agar Task 1 ke 9 tables already create ho gaye hain, to ab:

SQL Server → SupplyChainFinanceManagement → New Query

Phir har table ke liye:

INSERT INTO dim_customer
(customer_code, customer, platform, channel, market, sub_zone, region)
VALUES
(70020104, 'Atliq e Store', 'E-Commerce', 'Direct', 'Austria', 'NE', 'EU'),
(70021096, 'Atliq e Store', 'E-Commerce', 'Direct', 'United Kingdom', 'NE', 'EU'),
(70022084, 'Atliq Exclusive', 'Brick & Mortar', 'Direct', 'USA', 'NA', 'NA');
Lekin abhi ye complete INSERT script mat run karna, because PDF screenshots only show a subset of records. Main tumhe incomplete data ko complete dataset bolkar nahi dungi.

Hume kya chahiye
Task 2 ke liye 9 tables ka complete data chahiye:

dim_customer

dim_product

fact_forecast_monthly

fact_freight_cost

fact_gross_price

fact_manufacturing_cost

fact_post_invoice_deductions

fact_pre_invoice_deductions

fact_sales_monthly

PDF explicitly says to insert the given records, so ideally hum actual dataset CSVs import karenge rather than manually typing hundreds/thousands of rows. 


Next: Agar tumhare paas AtliQ dataset ki CSV/Excel/ZIP file hai, upload kar do. Main usko check karke 9 tables ke exact INSERT/import steps bana dungi.


हो 👍 Task 2 सुरू करूया.

PDF मध्ये Task 2 मध्ये स्पष्ट सांगितले आहे की Table तयार केल्यानंतर दिलेल्या images मधील records respective tables मध्ये insert करायचे आहेत. 


आपण आधी एक महत्त्वाची गोष्ट लक्षात ठेवूया: PDF मध्ये पूर्ण dataset नाही, फक्त काही records चे screenshots आहेत. त्यामुळे मी random data तयार करणार नाही.

Task 2 मध्ये आपल्याला हे करायचे आहे:
dim_customer

dim_product

fact_forecast_monthly

fact_freight_cost

fact_gross_price

fact_manufacturing_cost

fact_post_invoice_deductions

fact_pre_invoice_deductions

fact_sales_monthly

या 9 tables मध्ये records INSERT करायचे आहेत.

उदा. dim_customer साठी PDF मध्ये दिसणारे records असे आहेत:

USE SupplyChainFinanceManagement;
GO

INSERT INTO dim_customer
(customer_code, customer, platform, channel, market, sub_zone, region)
VALUES
(70020104, 'Atliq e Store', 'E-Commerce', 'Direct', 'Austria', 'NE', 'EU'),
(70021096, 'Atliq e Store', 'E-Commerce', 'Direct', 'United Kingdom', 'NE', 'EU'),
(70022084, 'Atliq Exclusive', 'Brick & Mortar', 'Direct', 'USA', 'NA', 'NA'),
(70022085, 'Atliq e Store', 'E-Commerce', 'Direct', 'USA', 'NA', 'NA'),
(70023031, 'Atliq Exclusive', 'Brick & Mortar', 'Direct', 'Canada', 'NA', 'NA'),
(70023032, 'Atliq e Store', 'E-Commerce', 'Direct', 'Canada', 'NA', 'NA'),
(70026206, 'Atliq e Store', 'E-Commerce', 'Direct', 'Mexico', 'LATAM', 'LATAM'),
(70027208, 'Atliq e Store', 'E-Commerce', 'Direct', 'Brazil', 'LATAM', 'LATAM'),
(80001019, 'Neptune', 'Brick & Mortar', 'Distributor', 'China', 'ROA', 'APAC'),
(8006154, 'Synthetic', 'Brick & Mortar', 'Distributor', 'Philippines', 'ROA', 'APAC'),
(8006155, 'Novus', 'Brick & Mortar', 'Distributor', 'Philippines', 'ROA', 'APAC');
पण लगेच हे सगळे run करू नकोस.
कारण Task 2 च्या screenshots मधले records sample/visible records आहेत; पूर्ण dataset नाही. त्यामुळे project complete करण्यासाठी आपल्याला पुढे exact/full data लागेल.

आपण step-by-step करूया:
👉 आधी dim_customer चे records insert करू.
👉 मग dim_product.
👉 मग बाकी 7 tables.

तू “customer done” म्हटल्यावर मी पुढचा dim_product देईन.


Screenshot 2026-10-05 123428.png
Screenshot 2026-10-05 123437.png
ye e na 7th no ka table

हो 👍 Task 3 मध्ये फक्त 2 questions आहेत. PDF नुसार आपण एकेक करून करूया. 


Task 3 — Q1
Question चा अर्थ मराठीत
आपल्याला date दिली आहे:

2023-07-15

या date वर एक function apply करायचा आणि तो date कोणत्या Fiscal Year मध्ये येतो ते सांगायचे आहे.

आपल्या project मध्ये Fiscal Year September ते August आहे.

म्हणून:

September 2022 → August 2023 = FY 2023

त्यामुळे:

15 July 2023 → FY 2023 ✅

SQL Server मध्ये query
SELECT 
    '2023-07-15' AS calendar_date,
    YEAR(DATEADD(MONTH, 4, '2023-07-15')) AS fiscal_year;
Result
calendar_date	fiscal_year
2023-07-15	2023
हे का?
आपण date ला 4 months पुढे shift करतो:

2023-07-15
→ 2023-11-15

मग:

YEAR('2023-11-15')
→ 2023

म्हणून Fiscal Year = 2023.

आता ही query SQL Server मध्ये Run कर.
Result 2023 आला की मला “Q1 done” सांग. मग आपण Task 3 Q2 — Monthly Product Transactions Report करू.

This might also interest you.



Ad

Haan 😊 yehi chat mein hi dete hain. Aapko kisi aur chat me jaane ki zarurat nahi hai.

Aap Task 5 ke Q1 se Q20 isi chat mein one-by-one run karo.
Jab bhi kisi question mein error aaye, error ka screenshot/text yahin bhej do — main wahi fix karungi.

Task 5 ke baad isi chat mein Task 6 bhi complete karenge. ❤️


yek sat do task 5 che

Haan 😊 Task 5 ek saath de rahi hoon — Q1 to Q20, same chat mein. Aap copy karke one-by-one SQL Server mein run karo.

Task 5 PDF ke exact questions ke basis par hai. 


TASK 5 — Advanced SQL Questions
Q1. UDF – Total Forecasted Quantity
CREATE FUNCTION fn_TotalForecastQuantity
(
    @product_code VARCHAR(45),
    @fiscal_year INT
)
RETURNS INT
AS
BEGIN
    DECLARE @total_quantity INT;

    SELECT @total_quantity = SUM(forecast_quantity)
    FROM fact_forecast_monthly
    WHERE product_code = @product_code
      AND fiscal_year = @fiscal_year;

    RETURN ISNULL(@total_quantity, 0);
END;
GO

SELECT dbo.fn_TotalForecastQuantity('A0118150101', 2018)
AS total_forecast_quantity;
Q2. Customers Above Average Monthly Sales
WITH CustomerMonthlySales AS
(
    SELECT
        customer_code,
        date,
        SUM(sold_quantity) AS monthly_sales
    FROM fact_sales_monthly
    GROUP BY customer_code, date
),
AverageMonthlySales AS
(
    SELECT AVG(monthly_sales) AS avg_monthly_sales
    FROM CustomerMonthlySales
)
SELECT
    customer_code,
    date,
    monthly_sales
FROM CustomerMonthlySales
WHERE monthly_sales >
      (SELECT avg_monthly_sales
       FROM AverageMonthlySales)
ORDER BY monthly_sales DESC;
Q3. Stored Procedure – Update Gross Price
CREATE PROCEDURE sp_UpdateGrossPrice
(
    @product_code VARCHAR(45),
    @fiscal_year INT,
    @new_gross_price DECIMAL(15,4)
)
AS
BEGIN
    UPDATE fact_gross_price
    SET gross_price = @new_gross_price
    WHERE product_code = @product_code
      AND fiscal_year = @fiscal_year;
END;
GO

EXEC sp_UpdateGrossPrice
    'A0118150101',
    2018,
    20.50;
Q4. Trigger – Sales Audit Log
CREATE TABLE sales_audit_log
(
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    product_code VARCHAR(45),
    customer_code INT,
    sale_date DATE,
    sold_quantity INT,
    audit_date DATETIME DEFAULT GETDATE()
);
GO

CREATE TRIGGER trg_SalesAudit
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    INSERT INTO sales_audit_log
    (
        product_code,
        customer_code,
        sale_date,
        sold_quantity
    )
    SELECT
        product_code,
        customer_code,
        date,
        sold_quantity
    FROM inserted;
END;
GO
Q5. Rank Products by Monthly Sales
SELECT
    fiscal_year,
    product_code,
    sales_month,
    total_sales_quantity,
    RANK() OVER
    (
        PARTITION BY fiscal_year, sales_month
        ORDER BY total_sales_quantity DESC
    ) AS product_rank
FROM
(
    SELECT
        YEAR(DATEADD(MONTH, 4, date)) AS fiscal_year,
        MONTH(date) AS sales_month,
        product_code,
        SUM(sold_quantity) AS total_sales_quantity
    FROM fact_sales_monthly
    GROUP BY
        YEAR(DATEADD(MONTH, 4, date)),
        MONTH(date),
        product_code
) AS x
ORDER BY
    fiscal_year,
    sales_month,
    product_rank;
Q6. STRING_AGG Customer Names
SELECT
    s.product_code,
    STRING_AGG(c.customer, ', ') AS customer_names
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
    ON s.customer_code = c.customer_code
WHERE s.product_code = 'A0118150101'
  AND s.date BETWEEN '2017-09-01' AND '2018-08-31'
GROUP BY s.product_code;
Q7. UDF – Total Manufacturing Cost
CREATE FUNCTION fn_TotalManufacturingCost
(
    @product_code VARCHAR(45),
    @start_year INT,
    @end_year INT
)
RETURNS DECIMAL(18,4)
AS
BEGIN
    DECLARE @total_cost DECIMAL(18,4);

    SELECT @total_cost =
    (
        SELECT SUM(manufacturing_cost)
        FROM fact_manufacturing_cost
        WHERE product_code = @product_code
          AND cost_year BETWEEN @start_year AND @end_year
    );

    RETURN ISNULL(@total_cost, 0);
END;
GO

SELECT dbo.fn_TotalManufacturingCost
(
    'A0118150101',
    2018,
    2021
) AS total_manufacturing_cost;
Q8. Procedure + Trigger – Inventory Check
First create inventory table:

CREATE TABLE product_inventory
(
    product_code VARCHAR(45) PRIMARY KEY,
    inventory_quantity INT
);
GO

INSERT INTO product_inventory
VALUES
('A0118150101', 100);
GO
Trigger:

CREATE TRIGGER trg_CheckInventory
ON fact_sales_monthly
INSTEAD OF INSERT
AS
BEGIN

    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        JOIN product_inventory p
            ON i.product_code = p.product_code
        WHERE i.sold_quantity > p.inventory_quantity
    )
    BEGIN
        RAISERROR('Sold quantity exceeds available inventory.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    INSERT INTO fact_sales_monthly
    (
        date,
        product_code,
        customer_code,
        sold_quantity
    )
    SELECT
        date,
        product_code,
        customer_code,
        sold_quantity
    FROM inserted;
END;
GO
Procedure:

CREATE PROCEDURE sp_InsertSale
(
    @date DATE,
    @product_code VARCHAR(45),
    @customer_code INT,
    @sold_quantity INT
)
AS
BEGIN
    INSERT INTO fact_sales_monthly
    (
        date,
        product_code,
        customer_code,
        sold_quantity
    )
    VALUES
    (
        @date,
        @product_code,
        @customer_code,
        @sold_quantity
    );
END;
GO
Q9. LAG – Previous Month Sales
SELECT
    product_code,
    date,
    sold_quantity,
    LAG(sold_quantity) OVER
    (
        PARTITION BY product_code
        ORDER BY date
    ) AS previous_month_sales
FROM fact_sales_monthly
ORDER BY
    product_code,
    date;
Q10. Top-Selling Product in Each Market
WITH MarketProductSales AS
(
    SELECT
        c.market,
        s.product_code,
        SUM(s.sold_quantity) AS total_sales_quantity
    FROM fact_sales_monthly AS s
    JOIN dim_customer AS c
        ON s.customer_code = c.customer_code
    GROUP BY
        c.market,
        s.product_code
),
RankedProducts AS
(
    SELECT
        market,
        product_code,
        total_sales_quantity,
        RANK() OVER
        (
            PARTITION BY market
            ORDER BY total_sales_quantity DESC
        ) AS product_rank
    FROM MarketProductSales
)
SELECT
    market,
    product_code,
    total_sales_quantity
FROM RankedProducts
WHERE product_rank = 1;
Q11. UDF – Total Freight Cost
CREATE FUNCTION fn_TotalFreightCost
(
    @product_code VARCHAR(45),
    @market VARCHAR(45),
    @fiscal_year INT
)
RETURNS DECIMAL(18,4)
AS
BEGIN
    DECLARE @freight_cost DECIMAL(18,4);

    SELECT @freight_cost =
        ISNULL(gp.gross_price, 0) *
        ISNULL(fc.freight_pct, 0)
    FROM fact_gross_price gp
    JOIN fact_freight_cost fc
        ON gp.fiscal_year = fc.fiscal_year
    WHERE gp.product_code = @product_code
      AND gp.fiscal_year = @fiscal_year
      AND fc.market = @market;

    RETURN ISNULL(@freight_cost, 0);
END;
GO
Procedure:

CREATE PROCEDURE sp_CalculateOverallCost
(
    @product_code VARCHAR(45),
    @market VARCHAR(45),
    @fiscal_year INT
)
AS
BEGIN
    SELECT
        @product_code AS product_code,
        @market AS market,
        @fiscal_year AS fiscal_year,
        mc.manufacturing_cost,

        dbo.fn_TotalFreightCost
        (
            @product_code,
            @market,
            @fiscal_year
        ) AS freight_cost,

        mc.manufacturing_cost +
        dbo.fn_TotalFreightCost
        (
            @product_code,
            @market,
            @fiscal_year
        ) AS overall_cost

    FROM fact_manufacturing_cost mc
    WHERE mc.product_code = @product_code
      AND mc.cost_year = @fiscal_year;
END;
GO

EXEC sp_CalculateOverallCost
'A0118150101',
'India',
2018;
Q12. Trigger – Update Inventory
CREATE TRIGGER trg_UpdateInventory
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.inventory_quantity =
        p.inventory_quantity - x.total_sold
    FROM product_inventory p
    JOIN
    (
        SELECT
            product_code,
            SUM(sold_quantity) AS total_sold
        FROM inserted
        GROUP BY product_code
    ) x
        ON p.product_code = x.product_code;
END;
GO
Q13. Trigger – Check Product Exists
CREATE TRIGGER trg_CheckProductExists
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM dim_product p
            WHERE p.product_code = i.product_code
        )
    )
    BEGIN
        RAISERROR
        (
            'Product does not exist in dim_product.',
            16,
            1
        );

        ROLLBACK TRANSACTION;
    END;
END;
GO
Q14. Stored Procedure – Month-over-Month Growth
CREATE PROCEDURE sp_MonthlySalesGrowth
AS
BEGIN

    WITH MonthlySales AS
    (
        SELECT
            product_code,
            date,
            SUM(sold_quantity) AS total_sales
        FROM fact_sales_monthly
        GROUP BY
            product_code,
            date
    ),
    SalesWithPrevious AS
    (
        SELECT
            product_code,
            date,
            total_sales,
            LAG(total_sales) OVER
            (
                PARTITION BY product_code
                ORDER BY date
            ) AS previous_sales
        FROM MonthlySales
    )

    SELECT
        product_code,
        date,
        total_sales,
        previous_sales,

        ((total_sales - previous_sales) * 100.0 /
            NULLIF(previous_sales, 0))
            AS growth_percentage

    FROM SalesWithPrevious
    ORDER BY product_code, date;

END;
GO

EXEC sp_MonthlySalesGrowth;
Q15. UDF – Average Discount
CREATE FUNCTION fn_AverageDiscount
(
    @product_code VARCHAR(45)
)
RETURNS DECIMAL(10,4)
AS
BEGIN
    DECLARE @avg_discount DECIMAL(10,4);

    SELECT @avg_discount =
        AVG(discounts_pct)
    FROM fact_post_invoice_deductions
    WHERE product_code = @product_code;

    RETURN ISNULL(@avg_discount, 0);
END;
GO

SELECT dbo.fn_AverageDiscount('A0118150101')
AS average_discount;
Q16. Highest Purchases in Each Region
WITH CustomerRegionSales AS
(
    SELECT
        c.region,
        c.customer_code,
        c.customer,
        SUM(s.sold_quantity) AS total_purchases
    FROM fact_sales_monthly s
    JOIN dim_customer c
        ON s.customer_code = c.customer_code
    GROUP BY
        c.region,
        c.customer_code,
        c.customer
),
RankedCustomers AS
(
    SELECT
        *,
        RANK() OVER
        (
            PARTITION BY region
            ORDER BY total_purchases DESC
        ) AS customer_rank
    FROM CustomerRegionSales
)
SELECT
    region,
    customer_code,
    customer,
    total_purchases
FROM RankedCustomers
WHERE customer_rank = 1;
Q17. Stored Procedure – Total Revenue
CREATE PROCEDURE sp_TotalRevenue
(
    @start_date DATE,
    @end_date DATE
)
AS
BEGIN

    SELECT
        SUM(s.sold_quantity * gp.gross_price)
        AS total_revenue

    FROM fact_sales_monthly s

    JOIN fact_gross_price gp
        ON s.product_code = gp.product_code
        AND YEAR(DATEADD(MONTH, 4, s.date))
            = gp.fiscal_year

    WHERE s.date BETWEEN @start_date AND @end_date;

END;
GO

EXEC sp_TotalRevenue
'2017-09-01',
'2018-08-31';
Q18. Trigger – New Product Forecast
CREATE TRIGGER trg_NewProductForecast
ON dim_product
AFTER INSERT
AS
BEGIN

    INSERT INTO fact_forecast_monthly
    (
        date,
        fiscal_year,
        product_code,
        customer_code,
        forecast_quantity
    )
    SELECT
        CAST(GETDATE() AS DATE),
        YEAR(DATEADD(MONTH, 4, GETDATE())),
        product_code,
        0,
        0
    FROM inserted;

END;
GO
⚠️ Note: PDF asks for UDF-based forecast update, but your provided 9-table schema does not give a formula for calculating the forecast quantity of a newly added product. So this is the structural trigger only; we should not invent a forecast formula. 


Q19. Sales Outlier Trigger
First create log table:

CREATE TABLE sales_outlier_log
(
    outlier_id INT IDENTITY(1,1) PRIMARY KEY,
    product_code VARCHAR(45),
    sale_date DATE,
    sold_quantity INT,
    average_sales DECIMAL(18,2),
    flag VARCHAR(30),
    created_date DATETIME DEFAULT GETDATE()
);
GO
Trigger:

CREATE TRIGGER trg_SalesOutlier
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN

    INSERT INTO sales_outlier_log
    (
        product_code,
        sale_date,
        sold_quantity,
        average_sales,
        flag
    )

    SELECT
        i.product_code,
        i.date,
        i.sold_quantity,
        x.average_sales,
        'OUTLIER'

    FROM inserted i

    JOIN
    (
        SELECT
            product_code,
            AVG(CAST(sold_quantity AS DECIMAL(18,2)))
            AS average_sales
        FROM fact_sales_monthly
        GROUP BY product_code
    ) x
        ON i.product_code = x.product_code

    WHERE i.sold_quantity > x.average_sales * 2;

END;
GO
Q20. Highest Average Gross Price
SELECT
    product_code,
    AVG(gross_price) AS average_gross_price
FROM fact_gross_price
GROUP BY product_code
ORDER BY average_gross_price DESC;
बस, Task 5 के पूरे Q1–Q20 ये हैं. ✅
आप Q1 से शुरू करके one-by-one run करो. जिस question पर error आए, बस उसका error screenshot/text भेज देना, मैं उसी को fix कर दूँगी — बाकी questions को unnecessarily change नहीं करेंगे. ❤️


jese ap ne task 4 ka yek sat sb kuch diya he na vese task 5 ke do

Haan, exactly Task 4 jaisa chahiye — matlab Task 5 ke Q1–Q20 ek hi jagah, question + final SQL answer, extra explanation ke bina. 👍

Task 5 ke questions uploaded PDF ke basis par hain. 


TASK 5 — ADVANCED SQL
Q1. UDF – Total Forecasted Quantity
CREATE FUNCTION fn_TotalForecastQuantity
(
    @product_code VARCHAR(45),
    @fiscal_year INT
)
RETURNS INT
AS
BEGIN
    DECLARE @total_quantity INT;

    SELECT @total_quantity = SUM(forecast_quantity)
    FROM fact_forecast_monthly
    WHERE product_code = @product_code
      AND fiscal_year = @fiscal_year;

    RETURN ISNULL(@total_quantity, 0);
END;
GO

SELECT dbo.fn_TotalForecastQuantity('A0118150101', 2018)
AS total_forecast_quantity;
Q2. Customers Whose Purchases Exceed Average Monthly Sales
WITH CustomerMonthlySales AS
(
    SELECT
        customer_code,
        date,
        SUM(sold_quantity) AS monthly_sales
    FROM fact_sales_monthly
    GROUP BY customer_code, date
),
AverageMonthlySales AS
(
    SELECT AVG(monthly_sales) AS avg_monthly_sales
    FROM CustomerMonthlySales
)
SELECT
    customer_code,
    date,
    monthly_sales
FROM CustomerMonthlySales
WHERE monthly_sales >
      (SELECT avg_monthly_sales
       FROM AverageMonthlySales)
ORDER BY monthly_sales DESC;
Q3. Stored Procedure – Update Gross Price
CREATE PROCEDURE sp_UpdateGrossPrice
(
    @product_code VARCHAR(45),
    @fiscal_year INT,
    @new_gross_price DECIMAL(15,4)
)
AS
BEGIN
    UPDATE fact_gross_price
    SET gross_price = @new_gross_price
    WHERE product_code = @product_code
      AND fiscal_year = @fiscal_year;
END;
GO

EXEC sp_UpdateGrossPrice
    'A0118150101',
    2018,
    20.50;
Q4. Trigger – Sales Audit Log
CREATE TABLE sales_audit_log
(
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    product_code VARCHAR(45),
    customer_code INT,
    sale_date DATE,
    sold_quantity INT,
    audit_date DATETIME DEFAULT GETDATE()
);
GO

CREATE TRIGGER trg_SalesAudit
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    INSERT INTO sales_audit_log
    (
        product_code,
        customer_code,
        sale_date,
        sold_quantity
    )
    SELECT
        product_code,
        customer_code,
        date,
        sold_quantity
    FROM inserted;
END;
GO
Q5. Rank Products Based on Monthly Sales Quantity
SELECT
    fiscal_year,
    product_code,
    sales_month,
    total_sales_quantity,
    RANK() OVER
    (
        PARTITION BY fiscal_year, sales_month
        ORDER BY total_sales_quantity DESC
    ) AS product_rank
FROM
(
    SELECT
        YEAR(DATEADD(MONTH, 4, date)) AS fiscal_year,
        MONTH(date) AS sales_month,
        product_code,
        SUM(sold_quantity) AS total_sales_quantity
    FROM fact_sales_monthly
    GROUP BY
        YEAR(DATEADD(MONTH, 4, date)),
        MONTH(date),
        product_code
) AS x
ORDER BY
    fiscal_year,
    sales_month,
    product_rank;
Q6. STRING_AGG – Customer Names for a Product
SELECT
    s.product_code,
    STRING_AGG(c.customer, ', ') AS customer_names
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
    ON s.customer_code = c.customer_code
WHERE s.product_code = 'A0118150101'
  AND s.date BETWEEN '2017-09-01' AND '2018-08-31'
GROUP BY s.product_code;
Q7. UDF – Total Manufacturing Cost
CREATE FUNCTION fn_TotalManufacturingCost
(
    @product_code VARCHAR(45),
    @start_year INT,
    @end_year INT
)
RETURNS DECIMAL(18,4)
AS
BEGIN
    DECLARE @total_cost DECIMAL(18,4);

    SELECT @total_cost =
    (
        SELECT SUM(manufacturing_cost)
        FROM fact_manufacturing_cost
        WHERE product_code = @product_code
          AND cost_year BETWEEN @start_year AND @end_year
    );

    RETURN ISNULL(@total_cost, 0);
END;
GO

SELECT dbo.fn_TotalManufacturingCost
(
    'A0118150101',
    2018,
    2021
) AS total_manufacturing_cost;
Q8. Stored Procedure + Trigger – Inventory Check
CREATE TABLE product_inventory
(
    product_code VARCHAR(45) PRIMARY KEY,
    inventory_quantity INT
);
GO

INSERT INTO product_inventory
VALUES
('A0118150101', 100);
GO

CREATE TRIGGER trg_CheckInventory
ON fact_sales_monthly
INSTEAD OF INSERT
AS
BEGIN

    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        JOIN product_inventory p
            ON i.product_code = p.product_code
        WHERE i.sold_quantity > p.inventory_quantity
    )
    BEGIN
        RAISERROR('Sold quantity exceeds available inventory.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    INSERT INTO fact_sales_monthly
    (
        date,
        product_code,
        customer_code,
        sold_quantity
    )
    SELECT
        date,
        product_code,
        customer_code,
        sold_quantity
    FROM inserted;
END;
GO

CREATE PROCEDURE sp_InsertSale
(
    @date DATE,
    @product_code VARCHAR(45),
    @customer_code INT,
    @sold_quantity INT
)
AS
BEGIN
    INSERT INTO fact_sales_monthly
    (
        date,
        product_code,
        customer_code,
        sold_quantity
    )
    VALUES
    (
        @date,
        @product_code,
        @customer_code,
        @sold_quantity
    );
END;
GO
Q9. LAG – Compare Monthly Sales with Previous Month
SELECT
    product_code,
    date,
    sold_quantity,
    LAG(sold_quantity) OVER
    (
        PARTITION BY product_code
        ORDER BY date
    ) AS previous_month_sales
FROM fact_sales_monthly
ORDER BY
    product_code,
    date;
Q10. Top-Selling Products in Each Market
WITH MarketProductSales AS
(
    SELECT
        c.market,
        s.product_code,
        SUM(s.sold_quantity) AS total_sales_quantity
    FROM fact_sales_monthly AS s
    JOIN dim_customer AS c
        ON s.customer_code = c.customer_code
    GROUP BY
        c.market,
        s.product_code
),
RankedProducts AS
(
    SELECT
        market,
        product_code,
        total_sales_quantity,
        RANK() OVER
        (
            PARTITION BY market
            ORDER BY total_sales_quantity DESC
        ) AS product_rank
    FROM MarketProductSales
)
SELECT
    market,
    product_code,
    total_sales_quantity
FROM RankedProducts
WHERE product_rank = 1;
Q11. UDF – Total Freight Cost + Procedure
CREATE FUNCTION fn_TotalFreightCost
(
    @product_code VARCHAR(45),
    @market VARCHAR(45),
    @fiscal_year INT
)
RETURNS DECIMAL(18,4)
AS
BEGIN
    DECLARE @freight_cost DECIMAL(18,4);

    SELECT @freight_cost =
        ISNULL(gp.gross_price, 0) *
        ISNULL(fc.freight_pct, 0)
    FROM fact_gross_price gp
    JOIN fact_freight_cost fc
        ON gp.fiscal_year = fc.fiscal_year
    WHERE gp.product_code = @product_code
      AND gp.fiscal_year = @fiscal_year
      AND fc.market = @market;

    RETURN ISNULL(@freight_cost, 0);
END;
GO

CREATE PROCEDURE sp_CalculateOverallCost
(
    @product_code VARCHAR(45),
    @market VARCHAR(45),
    @fiscal_year INT
)
AS
BEGIN
    SELECT
        @product_code AS product_code,
        @market AS market,
        @fiscal_year AS fiscal_year,
        mc.manufacturing_cost,
        dbo.fn_TotalFreightCost
        (
            @product_code,
            @market,
            @fiscal_year
        ) AS freight_cost,
        mc.manufacturing_cost +
        dbo.fn_TotalFreightCost
        (
            @product_code,
            @market,
            @fiscal_year
        ) AS overall_cost
    FROM fact_manufacturing_cost mc
    WHERE mc.product_code = @product_code
      AND mc.cost_year = @fiscal_year;
END;
GO

EXEC sp_CalculateOverallCost
'A0118150101',
'India',
2018;
Q12. Trigger – Update Inventory Count
CREATE TRIGGER trg_UpdateInventory
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.inventory_quantity =
        p.inventory_quantity - x.total_sold
    FROM product_inventory p
    JOIN
    (
        SELECT
            product_code,
            SUM(sold_quantity) AS total_sold
        FROM inserted
        GROUP BY product_code
    ) x
        ON p.product_code = x.product_code;
END;
GO
Q13. Trigger – Product Referential Integrity
CREATE TRIGGER trg_CheckProductExists
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM dim_product p
            WHERE p.product_code = i.product_code
        )
    )
    BEGIN
        RAISERROR
        (
            'Product does not exist in dim_product.',
            16,
            1
        );

        ROLLBACK TRANSACTION;
    END;
END;
GO
Q14. Stored Procedure – Month-over-Month Growth
CREATE PROCEDURE sp_MonthlySalesGrowth
AS
BEGIN

    WITH MonthlySales AS
    (
        SELECT
            product_code,
            date,
            SUM(sold_quantity) AS total_sales
        FROM fact_sales_monthly
        GROUP BY
            product_code,
            date
    ),
    SalesWithPrevious AS
    (
        SELECT
            product_code,
            date,
            total_sales,
            LAG(total_sales) OVER
            (
                PARTITION BY product_code
                ORDER BY date
            ) AS previous_sales
        FROM MonthlySales
    )

    SELECT
        product_code,
        date,
        total_sales,
        previous_sales,
        ((total_sales - previous_sales) * 100.0 /
            NULLIF(previous_sales, 0))
            AS growth_percentage
    FROM SalesWithPrevious
    ORDER BY product_code, date;

END;
GO

EXEC sp_MonthlySalesGrowth;
Q15. UDF – Average Discount %
CREATE FUNCTION fn_AverageDiscount
(
    @product_code VARCHAR(45)
)
RETURNS DECIMAL(10,4)
AS
BEGIN
    DECLARE @avg_discount DECIMAL(10,4);

    SELECT @avg_discount =
        AVG(discounts_pct)
    FROM fact_post_invoice_deductions
    WHERE product_code = @product_code;

    RETURN ISNULL(@avg_discount, 0);
END;
GO

SELECT dbo.fn_AverageDiscount('A0118150101')
AS average_discount;
Q16. Highest Total Purchases in Each Region
WITH CustomerRegionSales AS
(
    SELECT
        c.region,
        c.customer_code,
        c.customer,
        SUM(s.sold_quantity) AS total_purchases
    FROM fact_sales_monthly s
    JOIN dim_customer c
        ON s.customer_code = c.customer_code
    GROUP BY
        c.region,
        c.customer_code,
        c.customer
),
RankedCustomers AS
(
    SELECT
        *,
        RANK() OVER
        (
            PARTITION BY region
            ORDER BY total_purchases DESC
        ) AS customer_rank
    FROM CustomerRegionSales
)
SELECT
    region,
    customer_code,
    customer,
    total_purchases
FROM RankedCustomers
WHERE customer_rank = 1;
Q17. Stored Procedure – Total Revenue for Period
CREATE PROCEDURE sp_TotalRevenue
(
    @start_date DATE,
    @end_date DATE
)
AS
BEGIN

    SELECT
        SUM(s.sold_quantity * gp.gross_price)
        AS total_revenue
    FROM fact_sales_monthly s
    JOIN fact_gross_price gp
        ON s.product_code = gp.product_code
        AND YEAR(DATEADD(MONTH, 4, s.date))
            = gp.fiscal_year
    WHERE s.date BETWEEN @start_date AND @end_date;

END;
GO

EXEC sp_TotalRevenue
'2017-09-01',
'2018-08-31';
--Q18. Trigger – Update Forecast for New Product
CREATE TRIGGER trg_NewProductForecast
ON dim_product
AFTER INSERT
AS
BEGIN

    INSERT INTO fact_forecast_monthly
    (
        date,
        fiscal_year,
        product_code,
        customer_code,
        forecast_quantity
    )
    SELECT
        CAST(GETDATE() AS DATE),
        YEAR(DATEADD(MONTH, 4, GETDATE())),
        product_code,
        0,
        0
    FROM inserted;

END;
GO

--Q19. Trigger – Identify Sales Outliers
CREATE TABLE sales_outlier_log
(
    outlier_id INT IDENTITY(1,1) PRIMARY KEY,
    product_code VARCHAR(45),
    sale_date DATE,
    sold_quantity INT,
    average_sales DECIMAL(18,2),
    flag VARCHAR(30),
    created_date DATETIME DEFAULT GETDATE()
);
GO

CREATE TRIGGER trg_SalesOutlier
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN

    INSERT INTO sales_outlier_log
    (
        product_code,
        sale_date,
        sold_quantity,
        average_sales,
        flag
    )
    SELECT
        i.product_code,
        i.date,
        i.sold_quantity,
        x.average_sales,
        'OUTLIER'
    FROM inserted i
    JOIN
    (
        SELECT
            product_code,
            AVG(CAST(sold_quantity AS DECIMAL(18,2)))
            AS average_sales
        FROM fact_sales_monthly
        GROUP BY product_code
    ) x
        ON i.product_code = x.product_code
    WHERE i.sold_quantity > x.average_sales * 2;

END;
GO
--Q20. Products with Highest Average Gross Price
SELECT
    product_code,
    AVG(gross_price) AS average_gross_price
FROM fact_gross_price
GROUP BY product_code
ORDER BY average_gross_price DESC;


--TASK 6 — Forecast Accuracy Analysis
SELECT
    f.product_code,
    f.date,
    f.fiscal_year,
    SUM(f.forecast_quantity) AS forecast_quantity,
    ISNULL(SUM(s.sold_quantity), 0) AS actual_sold_quantity,
    ISNULL(SUM(s.sold_quantity), 0) * 100.0 /
        NULLIF(SUM(f.forecast_quantity), 0)
        AS forecast_accuracy_percentage
FROM fact_forecast_monthly AS f
LEFT JOIN fact_sales_monthly AS s
    ON f.product_code = s.product_code
    AND f.customer_code = s.customer_code
    AND f.date = s.date
WHERE f.product_code = 'A0118150101'
GROUP BY
    f.product_code,
    f.date,
    f.fiscal_year
ORDER BY
    f.fiscal_year,
    f.date;

	--Q3. Pivot – Forecast vs Actual Quantity by Month
	WITH MonthlyData AS
(
    SELECT
        f.fiscal_year,
        MONTH(f.date) AS month_no,
        'Forecast' AS metric,
        SUM(f.forecast_quantity) AS quantity
    FROM fact_forecast_monthly AS f
    WHERE f.product_code = 'A0118150101'
    GROUP BY
        f.fiscal_year,
        MONTH(f.date)

    UNION ALL

    SELECT
        YEAR(DATEADD(MONTH, 4, s.date)) AS fiscal_year,
        MONTH(s.date) AS month_no,
        'Actual' AS metric,
        SUM(s.sold_quantity) AS quantity
    FROM fact_sales_monthly AS s
    WHERE s.product_code = 'A0118150101'
    GROUP BY
        YEAR(DATEADD(MONTH, 4, s.date)),
        MONTH(s.date)
),
PivotedData AS
(
    SELECT
        fiscal_year,
        month_no,
        [Forecast],
        [Actual]
    FROM MonthlyData
    PIVOT
    (
        SUM(quantity)
        FOR metric IN ([Forecast], [Actual])
    ) AS p
)
SELECT
    fiscal_year,
    month_no,
    [Forecast] AS forecast_quantity,
    [Actual] AS actual_sold_quantity,
    [Actual] * 100.0 /
        NULLIF([Forecast], 0)
        AS forecast_accuracy_percentage
FROM PivotedData
ORDER BY
    fiscal_year,
    month_no;

	--Q4. Forecast Accuracy for All Products
	SELECT
    f.product_code,
    f.fiscal_year,
    SUM(f.forecast_quantity) AS total_forecast_quantity,
    ISNULL(SUM(s.sold_quantity), 0) AS total_actual_quantity,
    ISNULL(SUM(s.sold_quantity), 0) * 100.0 /
        NULLIF(SUM(f.forecast_quantity), 0)
        AS forecast_accuracy_percentage
FROM fact_forecast_monthly AS f
LEFT JOIN fact_sales_monthly AS s
    ON f.product_code = s.product_code
    AND f.customer_code = s.customer_code
    AND f.date = s.date
GROUP BY
    f.product_code,
    f.fiscal_year
ORDER BY
    forecast_accuracy_percentage DESC;
