SELECT * FROM customers;

-- To show all available rooms with room type and price---
SELECT 
    r.room_id,
    r.room_number,
    rt.type_name,
    rt.base_price,
    rt.capacity,
    r.floor_number,
    r.status
FROM rooms r
JOIN room_types rt 
    ON r.room_type_id = rt.room_type_id
WHERE r.status = 'Available'
ORDER BY rt.base_price;

-- To show booking details with customer and room information
SELECT 
    b.booking_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    r.room_number,
    rt.type_name,
    b.check_in_date,
    b.check_out_date,
    b.booking_status,
    b.total_amount
FROM bookings b
JOIN customers c 
    ON b.customer_id = c.customer_id
JOIN rooms r 
    ON b.room_id = r.room_id
JOIN room_types rt 
    ON r.room_type_id = rt.room_type_id
ORDER BY b.check_in_date;

-- To find bookings for a specific customer
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    b.booking_id,
    r.room_number,
    b.check_in_date,
    b.check_out_date,
    b.booking_status,
    b.total_amount
FROM customers c
JOIN bookings b 
    ON c.customer_id = b.customer_id
JOIN rooms r 
    ON b.room_id = r.room_id
WHERE c.email = 'ali.khan@example.com';

-- To calculate number of nights for each booking
SELECT 
    booking_id,
    check_in_date,
    check_out_date,
    check_out_date - check_in_date AS number_of_nights,
    total_amount
FROM bookings;

-- To get total revenue from completed payments
SELECT 
    SUM(amount) AS total_completed_revenue
FROM payments
WHERE payment_status = 'Completed';

-- To get revenue by payment method
SELECT 
    payment_method,
    SUM(amount) AS total_revenue,
    COUNT(payment_id) AS number_of_payments
FROM payments
WHERE payment_status = 'Completed'
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- To show unpaid or partially paid bookings
SELECT 
    b.booking_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    b.total_amount,
    COALESCE(SUM(p.amount), 0) AS amount_paid,
    b.total_amount - COALESCE(SUM(p.amount), 0) AS amount_due
FROM bookings b
JOIN customers c 
    ON b.customer_id = c.customer_id
LEFT JOIN payments p 
    ON b.booking_id = p.booking_id
    AND p.payment_status = 'Completed'
GROUP BY b.booking_id, customer_name, b.total_amount
HAVING b.total_amount > COALESCE(SUM(p.amount), 0);

-- To show services used by each booking
SELECT 
    b.booking_id,
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    s.service_name,
    bs.quantity,
    s.service_price,
    bs.quantity * s.service_price AS service_total,
    bs.service_date
FROM booking_services bs
JOIN bookings b 
    ON bs.booking_id = b.booking_id
JOIN customers c 
    ON b.customer_id = c.customer_id
JOIN services s 
    ON bs.service_id = s.service_id
ORDER BY b.booking_id;

-- To get total service revenue
SELECT 
    SUM(bs.quantity * s.service_price) AS total_service_revenue
FROM booking_services bs
JOIN services s 
    ON bs.service_id = s.service_id;
    
-- To get most popular services
SELECT 
    s.service_name,
    SUM(bs.quantity) AS total_times_used,
    SUM(bs.quantity * s.service_price) AS total_revenue
FROM booking_services bs
JOIN services s 
    ON bs.service_id = s.service_id
GROUP BY s.service_name
ORDER BY total_times_used DESC;

-- Bookings handled by each staff member
SELECT 
    CONCAT(st.first_name , ' ' , st.last_name) AS staff_name,
    st.role,
    COUNT(b.booking_id) AS total_bookings_handled
FROM staff st
LEFT JOIN bookings b 
    ON st.staff_id = b.staff_id
GROUP BY st.staff_id, staff_name, st.role
ORDER BY total_bookings_handled DESC;

-- To get room occupancy report
SELECT 
    r.room_number,
    rt.type_name,
    COUNT(b.booking_id) AS total_bookings,
    COALESCE(SUM(b.check_out_date - b.check_in_date), 0) AS total_nights_booked
FROM rooms r
JOIN room_types rt 
    ON r.room_type_id = rt.room_type_id
LEFT JOIN bookings b 
    ON r.room_id = b.room_id
GROUP BY r.room_id, r.room_number, rt.type_name
ORDER BY total_nights_booked DESC;

-- To update room status after check-in
UPDATE rooms
SET status = 'Occupied'
WHERE room_id = 5;

-- To check the updation
SELECT *
FROM rooms
WHERE room_id = 5;

-- To cancel a booking
-- Before cancellation
SELECT *
FROM bookings
WHERE booking_id = 4;

UPDATE bookings
SET booking_status = 'Cancelled'
WHERE booking_id = 4;

-- After cancellation
SELECT *
FROM bookings
WHERE booking_id = 4;

-- Delete a service from a booking
DELETE FROM booking_services
WHERE booking_service_id = 6;

SELECT *
FROM booking_services;

-- To search rooms within a price range
SELECT 
    r.room_number,
    rt.type_name,
    rt.base_price,
    rt.capacity,
    r.status
FROM rooms r
JOIN room_types rt 
    ON r.room_type_id = rt.room_type_id
WHERE rt.base_price BETWEEN 100 AND 250
AND r.status = 'Available'
ORDER BY rt.base_price;

-- To get full booking invoice
SELECT 
    b.booking_id,
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    r.room_number,
    rt.type_name,
    b.check_in_date,
    b.check_out_date,
    b.check_out_date - b.check_in_date AS nights,
    b.total_amount AS room_total,
    COALESCE(SUM(bs.quantity * s.service_price), 0) AS service_total,
    b.total_amount + COALESCE(SUM(bs.quantity * s.service_price), 0) AS grand_total
FROM bookings b
JOIN customers c 
    ON b.customer_id = c.customer_id
JOIN rooms r 
    ON b.room_id = r.room_id
JOIN room_types rt 
    ON r.room_type_id = rt.room_type_id
LEFT JOIN booking_services bs 
    ON b.booking_id = bs.booking_id
LEFT JOIN services s 
    ON bs.service_id = s.service_id
GROUP BY 
    b.booking_id,
    customer_name,
    r.room_number,
    rt.type_name,
    b.check_in_date,
    b.check_out_date,
    b.total_amount
ORDER BY b.booking_id;
