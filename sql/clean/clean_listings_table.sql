-- cleaning "listings" table


-- remove '$' and comma (thousands separator) from price
UPDATE listings
SET price = REPLACE(REPLACE(price, '$', ''), ',', '');


-- convert price to numeric
ALTER TABLE listings
ALTER COLUMN price TYPE NUMERIC(10, 2)
USING price::NUMERIC;

-- convert reviews_per_month to numeric and handle blanks
ALTER TABLE listings
ALTER COLUMN reviews_per_month TYPE NUMERIC
USING NULLIF(reviews_per_month, '')::NUMERIC;

-- preview results
SELECT * FROM listings LIMIT 10;