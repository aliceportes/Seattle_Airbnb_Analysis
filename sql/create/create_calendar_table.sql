-- creating "calendar" table

CREATE TABLE calendar (
    listing_id BIGINT,
    date DATE,
    available BOOLEAN,
    price TEXT, -- dirty, contains '$', clean later
    adjusted_price TEXT, -- will be dropped (empty column)
    minimum_nights INTEGER,
    maximum_nights INTEGER
);

-- preview raw data
SELECT * FROM calendar LIMIT 5;

