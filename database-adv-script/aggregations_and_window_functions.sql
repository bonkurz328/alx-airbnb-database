SELECT b.* 
FROM Bookings b 
WHERE user_id IN (
  SELECT SUM(*) 
  FROM User u 
  WHERE b.user_id = u.user_id 
);
