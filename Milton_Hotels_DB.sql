create database MiltonHotels;

drop table if exists Bill;
drop table if exists RoomsBooked;
drop table if exists Booking;
drop table if exists Room;
drop table if exists Transactions;
drop table if exists Guest;
drop table if exists GuestAddress;
drop table if exists HotelLocation;

create table MiltonHotels.GuestAddress
( gaid int,
street varchar(30) not null,
city varchar(25) not null,
country varchar(20) not null,
zip varchar(30),
primary key (gaid));

create table MiltonHotels.Guest
( gid int,
gaid int,
fname varchar(25) not null,
lname varchar(25) not null,
pno varchar(25) not null,
email varchar(30) not null,
dob date not null,
primary key (gid),
unique (email, pno),
foreign key (gaid) references MiltonHotels.GuestAddress(gaid));

create table MiltonHotels.HotelLocation
( hlid int,
street varchar(30) not null,
city varchar(30) not null,
country varchar(30) not null,
zip varchar(30),
gym bool,
pool bool,
wifi bool,
primary key (hlid));

create table MiltonHotels.Booking
( bid int,
gid int,
hlid int,
arrival_date date not null,
departure_date date not null,
checkin_time time,
checkout_time time,
num_adults int not null check (num_adults >= 1),
num_children int,
num_nights int generated always as (datediff(departure_date, arrival_date)) stored,
primary key (bid),
foreign key (gid) references MiltonHotels.Guest(gid),
foreign key (hlid) references MiltonHotels.HotelLocation(hlid));

create table MiltonHotels.Bill
( invoiceno int,
gid int,
bid int,
restaurant_charges int default 0.00,
bar_charges int default 0.00,
misc_charges int default 0.00,
primary key (invoiceno),
foreign key (gid) references MiltonHotels.Guest(gid),
foreign key (bid) references MiltonHotels.Booking(bid));

create table MiltonHotels.Transactions
( tid int,
invoiceno int,
name_on_card varchar(50) not null,
cardno varchar(20) not null,
expiry_date date not null,
cvv int not null,
card_issuer varchar(50),
payment_date date,
primary key (tid),
foreign key (invoiceno) references MiltonHotels.Bill(invoiceno));

create table MiltonHotels.Room
( rid int,
hlid int, 
roomno int not null,
rtype varchar(25) not null,
occupany int not null,
room_rate int,
primary key (rid),
foreign key (hlid) references MiltonHotels.HotelLocation(hlid));

create table MiltonHotels.RoomsBooked
( rbid int,
bid int,
invoiceno int,
rid int,
total_room_charge int default 0.00,
room_service int default 0.00,
primary key (rbid),
foreign key (bid) references MiltonHotels.Booking(bid),
foreign key (invoiceno) references MiltonHotels.Bill(invoiceno),
foreign key (rid) references MiltonHotels.Room(rid));

create view RoomsBooked_View as 
select rb.rbid, rb.bid, rb.invoiceno, rb.rid, r.room_rate * b.num_nights as total_room_charge, rb.room_service
from MiltonHotels.RoomsBooked rb
join MiltonHotels.Room r on rb.rid = r.rid
join MiltonHotels.Booking b on rb.bid = b.bid





