-- Part 1: Bookings per user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name, u.email
ORDER BY 
    total_bookings DESC;

-- Part 2: Property rankings by bookings
WITH PropertyBookings AS (
    SELECT 
        p.property_id,
        p.name AS property_name,
        p.location,
        COUNT(b.booking_id) AS booking_count
    FROM 
        Property p
    LEFT JOIN 
        Booking b ON p.property_id = b.property_id
    GROUP BY 
        p.property_id, p.name, p.location
)
SELECT 
    property_id,
    property_name,
    location,
    booking_count,
    RANK() OVER (ORDER BY booking_count DESC) AS property_rank,
    DENSE_RANK() OVER (ORDER BY booking_count DESC) AS dense_property_rank,
    ROW_NUMBER() OVER (ORDER BY booking_count DESC) AS row_num
FROM 
    PropertyBookings
ORDER BY 
    property_rank;
