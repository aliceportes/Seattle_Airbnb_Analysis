SELECT *
FROM  calendar

SELECT *
FROM  listings


-- average price by weekday + neighborhood groups
SELECT 
    TO_CHAR(c.date, 'Day') AS weekday,
    l.neighbourhood_group,
    ROUND(AVG(c.price), 2) AS avg_price
FROM calendar c
JOIN listings l ON c.listing_id = l.id
WHERE c.price > 0
  AND l.neighbourhood_group IS NOT NULL
  AND l.neighbourhood_group NOT ILIKE 'other neighborhoods'
GROUP BY weekday, l.neighbourhood_group
ORDER BY weekday, avg_price DESC;


--  top 5 most expensive neighbourhood groups (weekend)
SELECT 
    l.neighbourhood_group,
    ROUND(AVG(c.price), 2) AS weekend_avg_price
FROM calendar c
JOIN listings l ON c.listing_id = l.id
WHERE EXTRACT(DOW FROM c.date) IN (5, 6)  -- friday = 5, saturday = 6
  AND c.price > 0
GROUP BY l.neighbourhood_group
ORDER BY weekend_avg_price DESC
LIMIT 5;


-- Top 5 neighborhood cheapest neighbourhood groups (weekend)
SELECT 
    l.neighbourhood_group,
    ROUND(AVG(c.price), 2) AS weekend_avg_price
FROM calendar c
JOIN listings l ON c.listing_id = l.id
WHERE EXTRACT(DOW FROM c.date) IN (5, 6)  -- friday = 5, saturday = 6
  AND c.price > 0
  AND l.neighbourhood_group IS NOT NULL
  AND l.neighbourhood_group NOT ILIKE 'other%'
GROUP BY l.neighbourhood_group
ORDER BY weekend_avg_price ASC
LIMIT 5;

--  top 5 most expensive neighbourhood 
SELECT 
    l.neighbourhood,
    ROUND(AVG(c.price), 2) AS avg_price
FROM calendar c
JOIN listings l ON c.listing_id = l.id
GROUP BY l.neighbourhood
ORDER BY avg_price DESC
LIMIT 5;

-- top 5 most cheapest neighbourhood 
SELECT 
    l.neighbourhood,
    ROUND(AVG(c.price), 2) AS avg_price
FROM calendar c
JOIN listings l ON c.listing_id = l.id
GROUP BY l.neighbourhood
ORDER BY avg_price ASC
LIMIT 5;

-- top n neighbourhood by neighbourhood groups
SELECT 
    l.neighbourhood_group,
    l.neighbourhood,
    ROUND(AVG(c.price), 2) AS avg_price
FROM calendar c
JOIN listings l ON c.listing_id = l.id
WHERE l.neighbourhood_group IS NOT NULL
  AND l.neighbourhood IS NOT NULL
  AND c.price > 0
GROUP BY l.neighbourhood_group, l.neighbourhood;


-- availability rate by neighborhood
SELECT 
    l.neighbourhood,
    ROUND(AVG(CASE WHEN c.available THEN 1 ELSE 0 END) * 100, 2) AS availability_rate
FROM calendar c
JOIN listings l ON c.listing_id = l.id
GROUP BY l.neighbourhood
ORDER BY availability_rate DESC
LIMIT 10;

-- availability rate by neighborhood groups
SELECT 
    l.neighbourhood_group,
    ROUND(AVG(CASE WHEN c.available THEN 1 ELSE 0 END) * 100, 2) AS availability_rate
FROM calendar c
JOIN listings l ON c.listing_id = l.id
GROUP BY l.neighbourhood_group
ORDER BY availability_rate DESC
LIMIT 10;

-- price by month + room type
SELECT 
    DATE_TRUNC('month', c.date) AS month,
    l.room_type,
    ROUND(AVG(c.price), 2) AS avg_price
FROM calendar c
JOIN listings l ON c.listing_id = l.id
WHERE c.price > 0
GROUP BY month, l.room_type
ORDER BY month, l.room_type;

-- average price by time + neighborhood
SELECT 
    DATE_TRUNC('month', c.date) AS month,
    l.neighbourhood_group,
    ROUND(AVG(c.price), 2) AS avg_price
FROM calendar c
JOIN listings l ON c.listing_id = l.id
WHERE 
    l.neighbourhood_group IS NOT NULL
    AND l.neighbourhood_group NOT ILIKE 'other neighborhoods'
    AND c.price > 0
GROUP BY month, l.neighbourhood_group
ORDER BY month, l.neighbourhood_group;



