-- creating "reviews" table

CREATE TABLE reviews (
    listing_id BIGINT,
    review_id BIGINT,
    review_date DATE,
    reviewer_id BIGINT,
    reviewer_name TEXT,
    comments TEXT
);


-- preview raw data
SELECT * FROM reviews LIMIT 5;
