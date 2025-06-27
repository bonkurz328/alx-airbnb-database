CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash: VARCHAR(100), NOT NULL,
    phone_number VARCHAR(20),
    role: ENUM (guest, host, admin), NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Properties (
    property_id SERIAL PRIMARY KEY,
    host_id: Foreign Key, references User(user_id) 
    name: VARCHAR(50), NOT NULL,
    description TEXT(100), NOT NULL,
    location: VARCHAR(100), NOT NULL,
    pricepernight: DECIMAL(100), NOT NULL,
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP,
    updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    property_id INTEGER REFERENCES Properties(property_id),
    user_id INTEGER REFERENCES Users(user_id),
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INTEGER REFERENCES Bookings(booking_id),
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50),
    payment_date DATE,
    status VARCHAR(50) DEFAULT 'paid'
);

CREATE INDEX idx_property_city ON Properties(city);
CREATE INDEX idx_user_email ON Users(email);
CREATE INDEX idx_booking_user ON Bookings(user_id);
CREATE INDEX idx_booking_property ON Bookings(property_id);

