USE hotel_reservation_system;

INSERT INTO room_types (type_name, description, base_price, capacity)
VALUES
('Single', 'Room for one guest with one single bed', 80.00, 1),
('Double', 'Room for two guests with one double bed', 120.00, 2),
('Deluxe', 'Larger room with premium facilities', 180.00, 3),
('Suite', 'Luxury suite with living area and premium service', 300.00, 4);

INSERT INTO rooms (room_number, room_type_id, floor_number, status)
VALUES
('101', 1, 1, 'Available'),
('102', 1, 1, 'Available'),
('201', 2, 2, 'Available'),
('202', 2, 2, 'Maintenance'),
('301', 3, 3, 'Available'),
('401', 4, 4, 'Available');

INSERT INTO customers (first_name, last_name, email, phone, address)
VALUES
('Ali', 'Khan', 'ali.khan@example.com', '+4915111111111', 'Berlin, Germany'),
('Maria', 'Schmidt', 'maria.schmidt@example.com', '+4915222222222', 'Hamburg, Germany'),
('John', 'Smith', 'john.smith@example.com', '+4915333333333', 'Munich, Germany'),
('Sara', 'Ahmed', 'sara.ahmed@example.com', '+4915444444444', 'Frankfurt, Germany');

INSERT INTO staff (first_name, last_name, email, role, phone)
VALUES
('Emma', 'Muller', 'emma.muller@hotel.com', 'Receptionist', '+49301111111'),
('David', 'Brown', 'david.brown@hotel.com', 'Manager', '+49302222222'),
('Lena', 'Weber', 'lena.weber@hotel.com', 'Receptionist', '+49303333333');

INSERT INTO bookings 
(customer_id, room_id, staff_id, check_in_date, check_out_date, booking_status, total_amount)
VALUES
(1, 1, 1, '2026-04-10', '2026-04-12', 'Confirmed', 160.00),
(2, 3, 1, '2026-04-11', '2026-04-14', 'Confirmed', 360.00),
(3, 5, 2, '2026-04-15', '2026-04-18', 'Checked-in', 540.00),
(4, 6, 3, '2026-04-20', '2026-04-22', 'Confirmed', 600.00);

INSERT INTO payments (booking_id, amount, payment_method, payment_status)
VALUES
(1, 160.00, 'Credit Card', 'Completed'),
(2, 200.00, 'Debit Card', 'Completed'),
(2, 160.00, 'Cash', 'Pending'),
(3, 540.00, 'Bank Transfer', 'Completed'),
(4, 600.00, 'PayPal', 'Completed');

INSERT INTO services (service_name, service_price)
VALUES
('Breakfast', 15.00),
('Airport Pickup', 50.00),
('Laundry', 20.00),
('Spa Access', 70.00),
('Room Cleaning', 10.00);

INSERT INTO booking_services (booking_id, service_id, quantity, service_date)
VALUES
(1, 1, 2, '2026-04-11'),
(1, 5, 1, '2026-04-11'),
(2, 1, 3, '2026-04-12'),
(2, 2, 1, '2026-04-11'),
(3, 4, 2, '2026-04-16'),
(4, 2, 1, '2026-04-20');

SELECT * FROM rooms;
SELECT * FROM room_types;
SELECT * FROM customers;
SELECT * FROM staff;
SELECT * FROM bookings;
SELECT * FROM payments;
SELECT * FROM services;
SELECT * FROM booking_services;

