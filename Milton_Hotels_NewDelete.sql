-- Delete values from each tables
-- Please note update was performed before deletion

-- 1. Table Room
delete from MiltonHotels.Room
where rid = 201;

-- 2. Table HotelLocation
delete from MiltonHotels.HotelLocation
where hlid = 2;

-- 3. Table RoomsBooked 
delete from MiltonHotels.RoomsBooked
where rbid = 3;

-- 4. Table Transactions
delete from MiltonHotels.Transactions
where tid = 3;

-- 5. Table Bill
delete from MiltonHotels.Bill
where invoiceno = 2;

-- 6. Table Booking
delete from MiltonHotels.Booking
where bid = 2;

-- 7. Table Guest
delete from MiltonHotels.Guest
where gid = 2;

-- 8. Table GuestAddress
delete from MiltonHotels.GuestAddress
where gaid = 2;


