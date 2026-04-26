USE hotel_reservation_system;

CREATE INDEX idx_bookings_customer_id
ON bookings(customer_id);

CREATE INDEX idx_bookings_room_id
ON bookings(room_id);

CREATE INDEX idx_bookings_check_in_date
ON bookings(check_in_date);

CREATE INDEX idx_payments_booking_id
ON payments(booking_id);

CREATE INDEX idx_booking_services_booking_id
ON booking_services(booking_id);