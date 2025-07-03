-- Insert sample data

insert into MiltonHotels.HotelLocation (hlid, street, city, country, zip, gym, pool, wifi) values
(1, '123 Main St', 'New York', 'USA', 10002, true, true, true),
(2, '654 Oak Ave', 'Los Angeles', 'USA', '90001', false, true, true),
(3, '987 Pine Ln', 'San Diego', 'USA', '91911', true, false, true),
(4, '101 Elm Rd', 'Houston', 'USA', '77001', false, false, false);

insert into MiltonHotels.Room (rid, hlid, roomno, rtype, occupany, room_rate) values
(101, 1, 550, 'Standard', 2, 150.00),
(102, 1, 820, 'Standard', 2, 150.00),
(201, 2, 790, 'Deluxe', 3, 250.00),
(301, 3, 550, 'Ocean View', 4, 375.00),
(401, 4, 910, 'Presidential Suite', 5, 500.00),
(402, 4, 330, 'Standard', 2, 200.00);

insert into MiltonHotels.GuestAddress values
(1, '321 Maple Dr', 'Paris', 'France', '70123'),
(2, '987 Cedar Blvd', 'New York', 'USA', '10019'),
(3, '111 Rose Ave', 'Port Nelson', 'Bahamas', null);

insert into MiltonHotels.Guest (gid, gaid, fname, lname, pno, email, dob) values
(1, 1, 'Celine', 'Laurent', '+33 6 12 34 56 78', 'cellylaurent@example.com', '2004-04-26'),
(2, 2, 'Charlie', 'Brown', '(347)000-111', 'cbrownie@example.com', '1950-07-30'),
(3, 3, 'Jane', 'Doe', '+1 (242) 355-1234', 'jane@example.com', '2001-01-01');

-- Booking 1: Celine Laurent, NY Location, 2 rooms, 5 nights
insert into MiltonHotels.Booking (bid, gid, hlid, arrival_date, 
departure_date, checkin_time, checkout_time, num_adults, num_children) values
(1, 1, 1, '2024-07-10', '2024-07-15', '15:00:00', '11:00:00', 2, 1);

-- Booking 2: Charlie Brown, Houston Location, 1 room, 3 nights
insert into MiltonHotels.Booking (bid, gid, hlid, arrival_date, 
departure_date, checkin_time, checkout_time, num_adults, num_children) values
(2, 2, 4, '2025-02-01', '2025-02-04', '15:00:00', '11:00:00', 1, 0);

-- Booking 3: Jane Doe, 1 room, San Diego Location, 1 room, 2 nights
insert into MiltonHotels.Booking (bid, gid, hlid, arrival_date, 
departure_date, checkin_time, checkout_time, num_adults, num_children) values
(3, 3, 3, '2026-09-05', '2026-09-07', '15:00:00', '11:00:00', 2, 3);

insert into MiltonHotels.Bill (invoiceno, gid, bid, restaurant_charges, bar_charges, misc_charges) values
(1, 1, 1, 300.28, 163.17, 25.00), -- Bill for Booking 1 
(2, 2, 2, 50.83, 72.60, default), -- Bill for Booking 2
(3, 3, 3,  default, default, default); -- Bill for Booking 3 

insert into MiltonHotels.RoomsBooked (rbid, bid, invoiceno, rid, room_service) values
(1, 1, 1, 101, 30),
(2, 1, 1, 102, 30),
(3, 2, 2, 401, 100),
(4, 3, 3, 301, default);

insert into MiltonHotels.Transactions (tid, invoiceno, name_on_card, cardno, expiry_date, cvv, card_issuer, payment_date) values
(1, 1, 'Celine Laurent', '4242 2222 3333 4444' , '2028-12-01', 123, 'Visa', '2024-07-20'), -- Booking 1: Split payment between 2 cards
(2, 1, 'David Lee', '5555 6666 7777 8888', '2027-06-01', 456, 'Mastercard', '2024-07-20'), 
(3, 2, 'Charlie Brown', '3782 822463 10005', '2029-01-01', 789, 'American Express', '2025-02-04'), 
(4, 3, 'Chris Walsh', '6011 1111 1111 1117', '2026-09-01', 101, 'Discover', null);

SELECT * 
FROM RoomsBooked_View