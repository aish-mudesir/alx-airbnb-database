EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.booking_date,
    b.user_id,
    u.user_name,
    u.email,
    b.property_id,
    p.property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
ORDER BY b.booking_date DESC;


