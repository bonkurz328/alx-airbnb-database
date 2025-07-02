SELECT * FROM Property 
WHERE property_id IN (
    -- Subquery: Get property_ids with AVG(rating) > 4.0
    SELECT property_id 
    FROM Review 
    GROUP BY property_id 
    HAVING AVG(rating) > 4.0  
); 

SELECT * FROM User 
WHERE user_id IN (
    SELECT user_id 
    FROM Booking 
    GROUP BY user_id 
    HAVING COUNT(*) > 3  
);

---

-- Modified for Best Practice 

SELECT u.* 
FROM User u
WHERE (
    SELECT COUNT(*) 
    FROM Booking b 
    WHERE b.user_id = u.user_id  -- Correlated subquery version
) > 3;
