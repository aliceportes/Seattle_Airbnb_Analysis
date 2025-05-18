SELECT *
FROM  reviews

-- total reviews
SELECT COUNT(*) AS total_reviews
FROM reviews;

-- number of reviews per month
SELECT 
    DATE_TRUNC('month', review_date) AS month,
    COUNT(*) AS review_count
FROM reviews
GROUP BY month
ORDER BY month;

-- number of reviews per year
SELECT 
    EXTRACT(YEAR FROM review_date) AS year,
    COUNT(*) AS review_count
FROM reviews
GROUP BY year
ORDER BY year;


-- top 10 reviewers 
SELECT 
    reviewer_id,
    reviewer_name,
    COUNT(*) AS total_reviews,
    COUNT(DISTINCT listing_id) AS unique_reviews
FROM reviews
GROUP BY reviewer_id, reviewer_name
ORDER BY unique_reviews DESC
LIMIT 10;




