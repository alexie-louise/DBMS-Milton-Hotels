-- Update values from each table

-- 1. Table GuestAddress
-- Storyline: Jane Doe moved to a different country and changed her identity. She was a part of a money heist, and the presidential
-- suite was purchased with a stolen credit card. She contacted Milton Hotels to update her personal information in the system.
update MiltonHotels.GuestAddress
set
street = '222 New Address Rd',
city = 'Vik',
country = 'Iceland',
zip = 870
where gaid = 3;

-- 2. Table Guest
update  MiltonHotels.Guest
set
fname = 'Guinevere',
lname = 'Beck',
pno = '+354 487 1345'
where gid = 3;

-- Guinevere Beck, previously known as Jane Doe, changed her trip dates. Celebrating the New Year with a new identity? 
-- Someone did not get the memo that "new year, new me" is NOT to be taken literally!
-- 3. Table Booking
update MiltonHotels.Booking
set 
arrival_date = '2026-12-20',
departure_date = '2027-01-02'
where gid = 3 and bid = 3;

-- 4. Table RoomsBooked
-- At an attempt to remain inconspicuous, Guinevere Beck downgraded to a standard room.
update MiltonHotels.RoomsBooked
set 
rid =  (
select r.rid 
from MiltonHotels.Room r
where rtype = 'Standard' and hlid = 4
limit 1
)
where rbid = 4;

-- 5. Table Transactions
-- Guinevere Beck changed the card on file
update MiltonHotels.Transactions
set 
name_on_card = 'Guinevere Beck',
cardno = '3782 822463 10005',
expiry_date = '2030-12-01',
cvv = 1234,
card_issuer = 'American Express'
where tid = 4;

-- 6. Table Bill
-- Charlie noticed he was mischarged at the restaurant. He paid $51, but his meal was $15. 
-- Update his bill 
update MiltonHotels.Bill
set
restaurant_charges = 15.00
where invoiceno = 2;


-- 7. Table Room
--At the NY location, renovations were completed, and additional square footage was made available.
--All standard rooms were upgraded to deluxe rooms.
update MiltonHotels.Room
set rtype = 'deluxe'
where hlid = 1 and rtype = 'standard';

-- 8. Table HotelLocation
-- The Milton Hotel in San Diego relocated to Miami, adding a gym to its list of amenities.
update MiltonHotels.HotelLocation
set
street = '210 Rosewood Pl',
city = 'Miami',
zip = 33101,
gym = true
where hlid = 3;
