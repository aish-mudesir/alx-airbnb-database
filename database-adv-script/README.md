# SQL Joins - Airbnb Database

This project demonstrates the use of different types of SQL joins using the Airbnb database.

## Objective
Master SQL joins by writing complex queries to connect multiple tables in a relational database.

---

## Queries

### 1. INNER JOIN
**File:** `joins_queries.sql`

**Description:**  
Retrieves all bookings along with the users who made those bookings.  
Only records with matching user and booking entries are displayed.

```sql
SELECT 
    bookings.id AS booking_id,
    users.id AS user_id,
    users.name AS user_name,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

