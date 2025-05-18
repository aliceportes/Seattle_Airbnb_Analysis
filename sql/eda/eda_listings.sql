SELECT *
FROM  listings

-- total distinct listings
SELECT COUNT(DISTINCT id) AS total_listings
FROM listings;

-- total distinct hosts
SELECT COUNT(DISTINCT host_id) AS total_hosts
FROM listings;

-- top 10 most common listing names (place title)
SELECT 
    name,
    COUNT(*) AS listing_count
FROM listings
GROUP BY name
ORDER BY listing_count DESC
LIMIT 10;

--  top 10 hosts by number of listings
SELECT 
    host_name,
    COUNT(*) AS listing_count
FROM listings
GROUP BY host_name
ORDER BY listing_count DESC
LIMIT 10;

-- Top 10 neighborhoods by number of listings
SELECT 
	neighbourhood, 
	COUNT(*) AS listing_count
FROM listings
GROUP BY neighbourhood
ORDER BY listing_count DESC
LIMIT 10;

-- top 10 neighbourhood groups by number of listings
SELECT 
    neighbourhood_group,
    COUNT(*) AS listing_count
FROM listings
WHERE neighbourhood_group IS NOT NULL
  AND neighbourhood_group NOT ILIKE 'other neighborhoods'
GROUP BY neighbourhood_group
ORDER BY listing_count DESC
LIMIT 10;

-- average price by neighborhood
SELECT 
    neighbourhood,
    ROUND(AVG(price), 2) AS avg_price
FROM listings
  WHERE price > 0
GROUP BY neighbourhood
ORDER BY avg_price DESC;


-- average price by neighborhood groups
SELECT 
    neighbourhood_group,
    ROUND(AVG(price), 2) AS avg_price
FROM listings
WHERE neighbourhood_group IS NOT NULL
  AND neighbourhood_group NOT ILIKE 'other neighborhoods'
  AND price > 0  
GROUP BY neighbourhood_group
ORDER BY avg_price DESC;

-- individual listings with price and location
SELECT 
    id AS listing_id,
    name,
    neighbourhood_group,
    latitude,
    longitude,
    price
FROM listings
WHERE price > 0
  AND latitude IS NOT NULL
  AND longitude IS NOT NULL
  AND neighbourhood_group NOT ILIKE 'other%';
  
-- Average price by room type
SELECT room_type, AVG(price) AS avg_price
FROM listings
GROUP BY room_type
ORDER BY avg_price DESC;

-- Average price by room type + neighborhood groups
SELECT 
    room_type,
    neighbourhood_group,
    AVG(price) AS avg_price
FROM listings
WHERE price > 0
  AND neighbourhood_group IS NOT NULL
GROUP BY room_type, neighbourhood_group
ORDER BY neighbourhood_group, avg_price DESC;

-- room price listing
SELECT 
    room_type,
FROM listings
WHERE room_type IS NOT NULL

-- Distribution of listings by room type
SELECT room_type, COUNT(*) AS total
FROM listings
WHERE room_type IS NOT NULL
GROUP BY room_type
ORDER BY total DESC;
