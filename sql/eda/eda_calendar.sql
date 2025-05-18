SELECT *
FROM  calendar

--average price
SELECT AVG(price) AS avg_price
FROM calendar
WHERE price > 0;

-- average price by month
SELECT 
    DATE_TRUNC('month', date) AS month,
    ROUND(AVG(price), 2) AS avg_price
FROM calendar
WHERE price > 0
GROUP BY month
ORDER BY month;

-- average price by day of week
SELECT 
    TO_CHAR(date, 'Day') AS weekday,
    ROUND(AVG(price), 2) AS avg_price
FROM calendar
WHERE price > 0
GROUP BY weekday
ORDER BY AVG(price) DESC;

-- average price by year
SELECT 
    EXTRACT(YEAR FROM date) AS year,
    ROUND(AVG(price), 2) AS avg_price
FROM calendar
WHERE price > 0
GROUP BY year
ORDER BY year;


-- availability rate
SELECT 
  ROUND(
    AVG(CASE WHEN available = TRUE THEN 1 ELSE 0 END),
    4
  ) AS availability_rate
FROM calendar;

-- availability rate by month
SELECT 
    DATE_TRUNC('month', date) AS month,
    ROUND(AVG(CASE WHEN available = 'true' THEN 1 ELSE 0 END) * 100, 2) AS availability_rate
FROM calendar
GROUP BY month
ORDER BY month;


