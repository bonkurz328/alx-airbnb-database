CREATE TABLE Users (
    user_id: Primary Key, UUID, Indexed,
    first_name: VARCHAR(100), NOT NULL,
    last_name: VARCHAR(100), NOT NULL,
    email: VARCHAR(100), UNIQUE, NOT NULL,
    password_hash: VARCHAR(50), NOT NULL,
    phone_number: VARCHAR(20), NULL,
    role: ENUM (guest, host, admin), NOT NULL,
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Properties (
    property_id: Primary Key, UUID, Indexed,
    host_id: Foreign Key, references User(user_id),
    name: VARCHAR(50), NOT NULL,
    description: TEXT(100), NOT NULL,
    location: VARCHAR(100), NOT NULL,
    pricepernight: DECIMAL(100), NOT NULL,
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
    updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE Bookings (
    booking_id: Primary Key, UUID, Indexed,
    property_id: Foreign Key, references Property(property_id),
    user_id: Foreign Key, references User(user_id),
    start_date: DATE, NOT NULL,
    end_date: DATE, NOT NULL,
    total_price: DECIMAL(10.2), NOT NULL,
    status: ENUM (pending, confirmed, canceled), NOT NULL,
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Payments (
    payment_id: Primary Key, UUID, Indexed,
    booking_id: Foreign Key, references Booking(booking_id),
    amount: DECIMAL(10.2), NOT NULL,
    payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP,
    payment_method: ENUM (credit_card, paypal, stripe), NOT NULL
);

CREATE TABLE Review (
    review_id: Primary Key, UUID, Indexed,
    property_id: Foreign Key, references Property(property_id),
    user_id: Foreign Key, references User(user_id),
    rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL,
    comment: TEXT(1000), NOT NULL,
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Message (
    message_id: Primary Key, UUID, Indexed,
    sender_id: Foreign Key, references User(user_id),
    recipient_id: Foreign Key, references User(user_id),
    message_body: TEXT(1000), NOT NULL,
    sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
);










