-- cleaning "reviews" table

-- remove HTML tag (<br/>) from comments
UPDATE reviews
SET comments = REPLACE(comments, '<br/>', ' ');


-- preview results
SELECT * FROM reviews
ORDER BY listing_id, review_date
LIMIT 10;