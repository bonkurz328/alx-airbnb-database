SELECT * FROM Property 
WHERE property_id IN (
    -- Subquery: Get property_ids with AVG(rating) > 4.0
    SELECT property_id 
    FROM Review 
    GROUP BY property_id 
    HAVING AVG(rating) > 4.0  -- HAVING (not WHERE) for aggregates!
); 

SELECT * FROM Booking 
WHERE user_id > 3.0; 
