
DROP TABLE IF EXISTS bookings CASCADE;

-- Create the master (parent) table for partitioning
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Create partitions by year
CREATE TABLE bookings_2024 PARTITION OF bookings
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Default partition for future or missing date ranges
CREATE TABLE bookings_default PARTITION OF bookings
DEFAULT;

-- Indexes for each partition
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024 (start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025 (start_date);
CREATE INDEX idx_bookings_default_start_date ON bookings_default (start_date);

-- Example: Add foreign key constraints
ALTER TABLE bookings
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    ADD CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(property_id);
