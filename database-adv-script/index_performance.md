-- ==============================================
-- Create Indexes for Users, Bookings, and Properties
-- ==============================================

-- Index for users table
CREATE INDEX idx_users_user_id ON users(user_id);

-- Indexes for bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Composite index for queries involving both user_id and property_id
CREATE INDEX idx_bookings_user_property ON bookings(user_id, property_id);

-- Optional index for booking_id if used for filtering or ordering
CREATE INDEX idx_bookings_booking_id ON bookings(booking_id);

-- Index for properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);


SELECT 
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name
ORDER BY property_rank;


EXPLAIN ANALYZE
SELECT 
    u.user_id,
    u.user_name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.user_name
ORDER BY total_bookings DESC;
