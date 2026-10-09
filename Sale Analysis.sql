select * from sk;

-- 1].
SELECT * FROM sk LIMIT 10;
-- 2].
select count(*) from sk;
-- 3].
select 
sum("Q-P1") as P1_Quantity,
sum("Q-P2") as P2_Quantity,
sum("Q-P3") as P3_Quantity,
sum("Q-P4") as P4_Quantity
from sk;

--4].
select 
sum("S-P1") as P1_sales,
sum("S-P2") as P2_sales,
sum("S-P3") as P3_sales,
sum("S-P4") as P4_sales
from sk;

--5].
select
sum("S-P1"+"S-P2"+"S-P3"+"S-P4")
from sk;

--5].
SELECT
    "Date",
    ("S-P1" + "S-P2" + "S-P3" + "S-P4") AS Total_Sales
FROM sk
ORDER BY "Date";

--6]Highest Sales
SELECT
    "Date",
    ("S-P1" + "S-P2" + "S-P3" + "S-P4") AS Total_Sales
FROM sk
ORDER BY Total_sales Desc;

--7] Avg
select 
avg("S-P1" + "S-P2" + "S-P3" + "S-P4")
from sk;

-- -8] Best Performance
SELECT
    SUM("S-P1") AS P1_Total,
    SUM("S-P2") AS P2_Total,
    SUM("S-P3") AS P3_Total,
    SUM("S-P4") AS P4_Total
FROM sk;



--1] Product-wise total quantity
Select 
sum("Q-P1") as P1_Quantity,
sum("Q-P2") as P2_Quantity,
sum("Q-P3") as P3_Quantity,
sum("Q-P4") as P4_Quantity
from sk;

-- 2]. Product-wise Avg quantity
Select 
avg("Q-P1") as P1_Average_Quantity,
avg("Q-P2") as P1_Average_Quantity,
avg("Q-P3") as P1_Average_Quantity,
avg("Q-P4") as P1_Average_Quantity
from sk;

-- 3]Product-wise average sales
Select 
Avg("S-P1") as P1_Avg_Sales,
Avg("S-P2") as P2_Avg_Sales,
Avg("S-P3") as P3_Avg_Sales,
Avg("S-P4") as P4_Avg_Sales
from sk ;

-- 4. Find the highest-selling day for each product

SELECT
	"Date",
	"S-P1",
	"S-P2",
	"S-P3",
	"S-P4"
FROM SK
ORDER BY "S-P1" DESC
LIMIT 1;


Select 
"Date", 
"S-P2"
from sk 
order by "S-P2" desc limit 1;

Select 
"Date", 
"S-P3"
from sk 
order by "S-P3" desc
limit 1;


Select 
"Date", 
"S-P4"
from sk 
order by "S-P4" desc
limit 1;

-- 5. Create a useful SQL view ⭐

CREATE VIEW daily_sales AS
SELECT
    "Date",
    "Q-P1",
    "Q-P2",
    "Q-P3",
    "Q-P4",
    "S-P1",
    "S-P2",
    "S-P3",
    "S-P4",
    ("S-P1" + "S-P2" + "S-P3" + "S-P4") AS total_sales
FROM sk;

select * from daily_sales 
order by total_sales desc;

select * from sk;

-- 1. Classify sales as High / Medium / Low

Select "Date", 
Case
	When "S-P1" + "S-P2" +"S-P3" + "S-P4" >=30000 Then 'High'
	When "S-P1" + "S-P2" +"S-P3" + "S-P4" >=15000 then 'Medium'
	Else 'Low'
end
from sk;

-- 2. Count High, Medium and Low days

SELECT
    CASE
        WHEN ("S-P1" + "S-P2" + "S-P3" + "S-P4") >= 30000 THEN 'High'
        WHEN ("S-P1" + "S-P2" + "S-P3" + "S-P4") >= 15000 THEN 'Medium'
        ELSE 'Low'
    END AS sales_performance,
    COUNT(*) AS number_of_days
FROM sk
GROUP BY
    CASE
        WHEN ("S-P1" + "S-P2" + "S-P3" + "S-P4") >= 30000 THEN 'High'
        WHEN ("S-P1" + "S-P2" + "S-P3" + "S-P4") >= 15000 THEN 'Medium'
        ELSE 'Low'
    END;


--3].Find only High-sales days
select 
"Date", 
("S-P1" + "S-P2" + "S-P3" + "S-P4") as total_sales
from sk 
where ("S-P1" + "S-P2" + "S-P3" + "S-P4") >= 30000
order by Total_sales DESC limit 1;

-- 4. Highest 10 sales days

select "Date",
("S-P1" + "S-P2" + "S-P3" + "S-P4") as total_sales
from sk 
order by Total_sales DESC limit 10;

-- 5. Lowest 10 sales days
select "Date",
("S-P1" + "S-P2" + "S-P3" + "S-P4") as total_sales
from sk 
order by Total_sales limit 10 ;


-- 1. Check date range
select 
min("Date"),
max("Date")
from sk;

-- 2. Monthly Sales ⭐
SELECT
    DATE_TRUNC('month', "Date") AS month,
    SUM("S-P1" + "S-P2" + "S-P3" + "S-P4") AS total_sales
FROM sk
GROUP BY DATE_TRUNC('month', "Date")
ORDER BY month;

-- 3. Monthly Quantity
SELECT
    DATE_TRUNC('month', "Date") AS month,
    SUM("Q-P1" + "Q-P2" + "Q-P3" + "Q-P4") AS total_sales
FROM sk
GROUP BY DATE_TRUNC('month', "Date")
ORDER BY month;

-- 4. Best Sales Month 🏆
SELECT
    DATE_TRUNC('month', "Date") AS month,
    SUM("S-P1" + "S-P2" + "S-P3" + "S-P4") AS total_sales
FROM sk
GROUP BY month
ORDER BY total_sales DESC
LIMIT 1;

-- 5. Worst Sales Month
SELECT
    DATE_TRUNC('month', "Date") AS month,
    SUM("S-P1" + "S-P2" + "S-P3" + "S-P4") AS total_sales
FROM sk
GROUP BY month
ORDER BY total_sales
LIMIT 1;

-- 6. Yearly Sales
SELECT
    EXTRACT(YEAR FROM "Date") AS year,
    SUM("S-P1" + "S-P2" + "S-P3" + "S-P4") AS total_sales
FROM sk
GROUP BY year
ORDER BY year;

-- 7. Monthly Sales with Year and Month
SELECT
    EXTRACT(YEAR FROM "Date") AS year,
    EXTRACT(MONTH FROM "Date") AS month,
    SUM("S-P1" + "S-P2" + "S-P3" + "S-P4") AS total_sales
FROM sk
GROUP BY year, month
ORDER BY year, month;

