SELECT *
FROM  reviews

SELECT *
FROM  listings


-- top 5 most popular listings by name (based on reviews)
SELECT 
    l.name AS listing_name,
    COUNT(*) AS review_count
FROM reviews r
JOIN listings l ON r.listing_id = l.id
WHERE l.name IS NOT NULL
GROUP BY l.name
ORDER BY review_count DESC
LIMIT 5;
