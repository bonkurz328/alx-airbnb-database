-- INNER JOIN to retrieve all bookings and the respective users 

SELECT * FROM Bookings 
INNER JOIN Users 
ON Bookings.user_id = Users.user_id; 

-- LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews 

SELECT 
  Property.property_id,
  Property.name AS property_name,
  Property.location,
  Reviews.review_id,
  Reviews.rating,
  Reviews.comment,
  Reviews.created_at AS review_date
FROM Property
LEFT JOIN Reviews ON Property.property_id = Reviews.property_id; 

-- FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user 

SELECT * FROM Users 
FULL OUTER JOIN Bookings 
ON Users.user_id = Bookings.user_id 

