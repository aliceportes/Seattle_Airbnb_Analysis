-- creating "listings" table

CREATE TABLE listings (
    id BIGINT,  
    name TEXT,
    host_id BIGINT,
    host_name TEXT,
    neighbourhood_group TEXT,
    neighbourhood TEXT,
    latitude NUMERIC(9,6),
    longitude NUMERIC(9,6),
    room_type TEXT,
    price TEXT,  -- dirty, contains '$', clean later
    minimum_nights INTEGER,
    number_of_reviews INTEGER,
    last_review DATE,  
    reviews_per_month TEXT,  -- needs conversion to NUMERIC
    calculated_host_listings_count INTEGER,
    availability_365 INTEGER,
    number_of_reviews_ltm INTEGER,
    license TEXT
);


-- preview raw data
SELECT * FROM listings LIMIT 5;

