-- cleaning "calendar" table

-- remove '$' and comma (thousands separator) from price
UPDATE calendar
SET 
    price = REPLACE(REPLACE(price, '$', ''), ',', '');

	
-- convert price to numeric
ALTER TABLE calendar
ALTER COLUMN price TYPE NUMERIC(10, 2)
USING price::NUMERIC;



-- drop adjusted_price (completely empty)
ALTER TABLE calendar
DROP COLUMN adjusted_price;


-- preview results
SELECT * FROM calendar LIMIT 10;


