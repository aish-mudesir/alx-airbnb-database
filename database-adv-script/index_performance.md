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
