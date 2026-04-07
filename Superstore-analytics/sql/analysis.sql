-- ========================================
-- 1. SELECCIONAR BASE DE DATOS
-- ========================================
USE sales_project;

-- ========================================
-- 2. EXPLORACIÓN INICIAL
-- ========================================

-- Ver datos
SELECT * FROM superstore LIMIT 10;

-- Contar registros (filas)
SELECT COUNT(*) AS total_rows
FROM superstore;

-- ========================================
-- 3. MÉTRICAS GENERALES (KPIs)
-- ========================================

-- Total Revenue
SELECT SUM(Sales) AS total_revenue
FROM superstore;

-- Total Profit
SELECT SUM(Profit) AS total_profit
FROM superstore;

-- Total Orders
SELECT COUNT(DISTINCT `Order ID`) AS total_orders
FROM superstore;

-- Total Customers
SELECT COUNT(DISTINCT `Customer ID`) AS total_customers
FROM superstore;

-- Average Discount
SELECT AVG(Discount) AS avg_discount
FROM superstore;

-- Total Quantity
SELECT SUM(Quantity) AS total_quantity
FROM superstore;

-- ========================================
-- 4. ANÁLISIS POR CATEGORÍA
-- ========================================

-- Sales y Profit por Category
SELECT
Category,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC;

-- Profit Margin por Category
SELECT
Category,
SUM(Profit)/SUM(Sales) AS profit_margin
FROM superstore
GROUP BY Category
ORDER BY profit_margin DESC;

-- ========================================
-- 5. ANÁLISIS POR REGIÓN
-- ========================================

SELECT
Region,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit
FROM superstore
GROUP BY Region
ORDER BY total_sales DESC;

-- ========================================
-- 6. ANÁLISIS POR SEGMENTO
-- ========================================

SELECT
Segment,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit
FROM superstore
GROUP BY Segment
ORDER BY total_sales DESC;

-- ========================================
-- 7. TREND DE VENTAS
-- ========================================

SELECT
YEAR(`Order Date`) AS year,
SUM(Sales) AS total_sales
FROM superstore
GROUP BY year
ORDER BY year;

-- ========================================
-- 8. PRODUCTOS
-- ========================================

-- Top productos por ventas
SELECT
`Product Name`,
SUM(Sales) AS total_sales
FROM superstore
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Productos con pérdidas
SELECT
`Product Name`,
SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Product Name`
HAVING total_profit < 0
ORDER BY total_profit ASC;

-- ========================================
-- 9. CLIENTES
-- ========================================

-- Top clientes por profit
SELECT
`Customer Name`,
SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Customer Name`
ORDER BY total_profit DESC
LIMIT 10;

-- Clientes con pérdidas
SELECT
`Customer Name`,
SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Customer Name`
HAVING total_profit < 0
ORDER BY total_profit ASC;

-- ========================================
-- 10. DESCUENTOS (CLAVE 🔥)
-- ========================================

-- Discount vs Sales y Profit
SELECT
Discount,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- ========================================
-- 11. SUB-CATEGORÍAS (PÉRDIDAS)
-- ========================================

SELECT
`Sub-Category`,
SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Sub-Category`
HAVING total_profit < 0
ORDER BY total_profit ASC;

-- ========================================
-- 12. INSIGHT FINAL (IMPORTANTE)
-- ========================================

-- Relación general descuento vs profit
SELECT
Discount,
AVG(Profit) AS avg_profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;
