-- Insert Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(1, 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_1', '1234567890', 'host'),
(2, 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw_2', NULL, 'guest'),
(3, 'Charlie', 'Lee', 'charlie@example.com', 'hashed_pw_3', '0987654321', 'guest'),
(4, 'Diana', 'Moyo', 'diana@example.com', 'hashed_pw_4', '0741122334', 'host'),
(5, 'Ethan', 'Khumalo', 'ethan@example.com', 'hashed_pw_5', NULL, 'admin');

-- Insert Properties
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight)
VALUES
(1, 1, 'Stylish Loft', 'Panoramic views and modern amenities.', 'Cape Town', 1200.00),
(2, 4, 'Cottage Retreat', 'Quiet and cozy.', 'Stellenbosch', 850.00),
(3, 4, 'Beachside Villa', 'Oceanfront luxury.', 'Durban', 2100.00),
(4, 1, 'City Apartment', 'In the heart of Johannesburg.', 'Johannesburg', 990.00),
(5, 4, 'Farm Stay', 'Rustic and serene farm living.', 'Free State', 750.00);

-- Insert Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(1, 1, 2, '2025-08-01', '2025-08-05', 4800.00, 'confirmed'),
(2, 2, 3, '2025-08-10', '2025-08-13', 2550.00, 'pending'),
(3, 3, 2, '2025-09-05', '2025-09-10', 10500.00, 'confirmed'),
(4, 4, 3, '2025-09-15', '2025-09-17', 1980.00, 'canceled'),
(5, 5, 2, '2025-10-01', '2025-10-04', 2250.00, 'pending');

-- Insert Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_method)
VALUES
(1, 1, 4800.00, 'stripe'),
(2, 2, 0.00, 'paypal'),
(3, 3, 10500.00, 'credit_card'),
(4, 4, 1980.00, 'paypal'),
(5, 5, 0.00, 'stripe');

-- Insert Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment)
VALUES
(1, 1, 2, 5, 'Fantastic stay!'),
(2, 2, 3, 4, 'Lovely cottage.'),
(3, 3, 2, 5, 'Luxury at its best.'),
(4, 4, 3, 3, 'Okay location.'),
(5, 5, 2, 4, 'Peaceful and rustic.');

-- Insert Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body)
VALUES
(1, 2, 1, 'Is the loft available early morning?'),
(2, 1, 2, 'Yes, from 10 AM.'),
(3, 3, 4, 'Can I bring my dog?'),
(4, 4, 3, 'Sure, pets are welcome!'),
(5, 2, 4, 'Is breakfast included?');

