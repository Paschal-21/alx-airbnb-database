-- Enable UUID generation (required)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

------------------------------------------------------------
-- INSERT SAMPLE USERS
------------------------------------------------------------
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (uuid_generate_v4(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '08012345678', 'guest'),
    (uuid_generate_v4(), 'Sarah', 'Smith', 'sarah.smith@example.com', 'hashed_password_2', '08022223333', 'host'),
    (uuid_generate_v4(), 'Michael', 'Brown', 'michael.brown@example.com', 'hashed_password_3', '08099998888', 'guest'),
    (uuid_generate_v4(), 'Alice', 'Wong', 'alice.wong@example.com', 'hashed_password_4', '08055556666', 'host'),
    (uuid_generate_v4(), 'Admin', 'User', 'admin@example.com', 'hashed_password_admin', NULL, 'admin');

-- Store IDs for reuse
-- (In real SQL usage, these would be returned programmatically)
-- For static seed, manually fetch inserted IDs if needed.


------------------------------------------------------------
-- INSERT SAMPLE PROPERTIES
------------------------------------------------------------
-- Assume Sarah Smith and Alice Wong are hosts.
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
SELECT uuid_generate_v4(), user_id,
       'Modern Apartment in Lagos',
       'A spacious and modern two-bedroom apartment in Victoria Island.',
       'Lagos, Nigeria', 45000
FROM users WHERE email = 'sarah.smith@example.com'
UNION ALL
SELECT uuid_generate_v4(), user_id,
       'Cozy Studio in Abuja',
       'A quiet and cozy studio apartment close to city center.',
       'Abuja, Nigeria', 30000
FROM users WHERE email = 'alice.wong@example.com';


------------------------------------------------------------
-- INSERT SAMPLE BOOKINGS
------------------------------------------------------------
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
SELECT uuid_generate_v4(),
       p.property_id,
       u.user_id,
       '2025-01-10',
       '2025-01-15',
       225000,
       'confirmed'
FROM properties p
JOIN users u ON u.email = 'john.doe@example.com'
WHERE p.name = 'Modern Apartment in Lagos'
UNION ALL
SELECT uuid_generate_v4(),
       p.property_id,
       u.user_id,
       '2025-02-01',
       '2025-02-05',
       120000,
       'pending'
FROM properties p
JOIN users u ON u.email = 'michael.brown@example.com'
WHERE p.name = 'Cozy Studio in Abuja';


------------------------------------------------------------
-- INSERT SAMPLE PAYMENTS
------------------------------------------------------------
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
SELECT uuid_generate_v4(), b.booking_id, b.total_price, 'credit_card'
FROM bookings b
WHERE b.status = 'confirmed';


------------------------------------------------------------
-- INSERT SAMPLE REVIEWS
------------------------------------------------------------
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
SELECT uuid_generate_v4(), p.property_id, u.user_id, 5, 'Amazing stay, highly recommended!'
FROM properties p
JOIN users u ON u.email = 'john.doe@example.com'
WHERE p.name = 'Modern Apartment in Lagos';


------------------------------------------------------------
-- INSERT SAMPLE MESSAGES
------------------------------------------------------------
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
SELECT uuid_generate_v4(),
       guest.user_id,
       host.user_id,
       'Hello, I wanted to ask about early check-in.'
FROM users guest, users host
WHERE guest.email = 'john.doe@example.com'
  AND host.email = 'sarah.smith@example.com'
UNION ALL
SELECT uuid_generate_v4(),
       host.user_id,
       guest.user_id,
       'Early check-in is possible. Please confirm your arrival time.'
FROM users guest, users host
WHERE guest.email = 'john.doe@example.com'
  AND host.email = 'sarah.smith@example.com';