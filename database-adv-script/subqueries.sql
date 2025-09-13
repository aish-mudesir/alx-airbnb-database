SELECT 
    u.user_id,
    u.user_name,
    p.property_id,
    p.property_name
FROM users u
JOIN bookings b ON u.user_id = b.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE (
    SELECT COUNT(*)
    FROM bookings b2
    WHERE b2.user_id = u.user_id
) > 3
AND p.property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)
GROUP BY u.user_id, u.user_name, p.property_id, p.property_name;
