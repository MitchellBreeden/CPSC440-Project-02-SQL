-- Step 1
drop schema if exists private cascade;
drop table if exists seatnum cascade;
drop table if exists seatrow cascade;
drop table if exists seat cascade;
drop table if exists customer cascade;
drop table if exists ticket cascade;

create schema private;

-- Step 2
create table seatnum (
    num int primary key
    );
    
create table seatrow (
    row varchar(2) primary key
    );
    
-- Step 3
insert into seatnum(num)
select generate_series(1,15);

insert into seatnum(num)
select generate_series(101,126);

insert into seatrow(row) values
('A'), ('B'), ('C'), ('D'), ('E'), ('F'), ('G'), ('H'), ('J'), ('K'), ('L'), ('M'), ('N'), ('O'), ('P'), ('Q'), ('R');
insert into seatrow(row) values
('AA'), ('BB'), ('CC'), ('DD'), ('EE'), ('FF'), ('GG'), ('HH');

create table seat (
	row varchar(2) references seatrow(row),
	num int references seatnum(num),
	section text not null,
    side text not null,
	pricingtier text not null,
	wheelchair boolean not null,
	constraint seat_pk primary key (num, row)
    );
	
-- Step 4
-- Main Floor, Middle
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Middle', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 1
and seatnum.num <= 10
and seatrow.row in ('A', 'B', 'C');
-- Main Floor, Middle
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Middle', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 1
and seatnum.num <= 11
and seatrow.row in ('D', 'E', 'F');
-- Main Floor, Middle
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Middle', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 1
and seatnum.num <= 12
and seatrow.row in ('G', 'H', 'J');
-- Main Floor, Middle
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Middle', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 1
and seatnum.num <= 13
and seatrow.row in ('K', 'L', 'M');
-- Main Floor, Middle
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Middle', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 1
and seatnum.num <= 14
and seatrow.row in ('N', 'O', 'P');
-- Main Floor, Middle
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Middle', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 1
and seatnum.num <= 15
and seatrow.row in ('Q', 'R');
-- Balcony, Middle
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Middle', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 1
and seatnum.num <= 13
and seatrow.row in ('AA');
-- Balcony, Middle
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Middle', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 1
and seatnum.num <= 14
and seatrow.row in ('BB', 'CC', 'DD');
-- Balcony, Middle
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Middle', 'Upper Balcony', false
from seatrow, seatnum
where seatnum.num >= 1
and seatnum.num <= 10
and seatrow.row in ('EE', 'FF');
-- Balcony, Middle
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Middle', 'Upper Balcony', false
from seatrow, seatnum
where seatnum.num >= 1
and seatnum.num <= 11
and seatrow.row in ('GG', 'HH');
-- Balcony, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Left', 'Upper Balcony', false
from seatrow, seatnum
where seatnum.num >= 101
and seatnum.num%2 != 0
and seatnum.num <= 117
and seatrow.row in ('HH');
-- Balcony, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Left', 'Upper Balcony', false
from seatrow, seatnum
where seatnum.num >= 101
and seatnum.num%2 != 0
and seatnum.num <= 119
and seatrow.row in ('GG');
-- Balcony, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Left', 'Upper Balcony', false
from seatrow, seatnum
where seatnum.num >= 101
and seatnum.num%2 != 0
and seatnum.num <= 121
and seatrow.row in ('FF', 'EE');
-- Balcony, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Left', 'Side', false
from seatrow, seatnum
where seatnum.num >= 101
and seatnum.num%2 != 0
and seatnum.num <= 125
and seatrow.row in ('DD');
-- Balcony, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Left', 'Side', false
from seatrow, seatnum
where seatnum.num >= 101
and seatnum.num%2 != 0
and seatnum.num <= 123
and seatrow.row in ('CC', 'BB', 'AA');
-- Balcony, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Right', 'Upper Balcony', false
from seatrow, seatnum
where seatnum.num >= 102
and seatnum.num%2 = 0
and seatnum.num <= 118
and seatrow.row in ('HH');
-- Balcony, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Right', 'Upper Balcony', false
from seatrow, seatnum
where seatnum.num >= 102
and seatnum.num%2 = 0
and seatnum.num <= 120
and seatrow.row in ('GG');
-- Balcony, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Right', 'Upper Balcony', false
from seatrow, seatnum
where seatnum.num >= 102
and seatnum.num%2 = 0
and seatnum.num <= 122
and seatrow.row in ('FF', 'EE');
-- Balcony, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Right', 'Side', false
from seatrow, seatnum
where seatnum.num >= 102
and seatnum.num%2 = 0
and seatnum.num <= 126
and seatrow.row in ('DD');
-- Balcony, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Balcony', 'Right', 'Side', false
from seatrow, seatnum
where seatnum.num >= 102
and seatnum.num%2 = 0
and seatnum.num <= 124
and seatrow.row in ('CC', 'BB', 'AA');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 101
and seatnum.num%2 != 0
and seatnum.num <= 105
and seatrow.row in ('R', 'Q', 'P', 'O');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 101
and seatnum.num%2 != 0
and seatnum.num <= 105
and seatrow.row in ('N', 'M', 'L', 'K');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 101
and seatnum.num%2 != 0
and seatnum.num <= 105
and seatrow.row in ('J', 'H', 'G', 'F');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 101
and seatnum.num%2 != 0
and seatnum.num <= 105
and seatrow.row in ('E', 'D', 'C', 'B');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 101
and seatnum.num%2 != 0
and seatnum.num <= 105
and seatrow.row in ('A');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Side', false
from seatrow, seatnum
where seatnum.num >= 107
and seatnum.num%2 != 0
and seatnum.num <= 113
and seatrow.row in ('A');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Side', false
from seatrow, seatnum
where seatnum.num >= 107
and seatnum.num%2 != 0
and seatnum.num <= 115
and seatrow.row in ('B', 'C', 'D', 'E');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Side', false
from seatrow, seatnum
where seatnum.num >= 107
and seatnum.num%2 != 0
and seatnum.num <= 117
and seatrow.row in ('F', 'G', 'H', 'J');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Side', false
from seatrow, seatnum
where seatnum.num >= 107
and seatnum.num%2 != 0
and seatnum.num <= 119
and seatrow.row in ('K', 'L', 'M', 'N');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Side', false
from seatrow, seatnum
where seatnum.num >= 107
and seatnum.num%2 != 0
and seatnum.num <= 121
and seatrow.row in ('O');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Side', false
from seatrow, seatnum
where seatnum.num = 107
and seatrow.row in ('P', 'Q', 'R');
-- Main Floor, Left
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Left', 'Side', true
from seatrow, seatnum
where seatnum.num >= 109
and seatnum.num%2 != 0
and seatnum.num <= 121
and seatrow.row in ('P', 'Q', 'R');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 102
and seatnum.num%2 = 0
and seatnum.num <= 106
and seatrow.row in ('R', 'Q', 'P', 'O');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 102
and seatnum.num%2 = 0
and seatnum.num <= 106
and seatrow.row in ('N', 'M', 'L', 'K');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 102
and seatnum.num%2 = 0
and seatnum.num <= 106
and seatrow.row in ('J', 'H', 'G', 'F');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 102
and seatnum.num%2 = 0
and seatnum.num <= 106
and seatrow.row in ('E', 'D', 'C', 'B');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Orchestra', false
from seatrow, seatnum
where seatnum.num >= 102
and seatnum.num%2 = 0
and seatnum.num <= 106
and seatrow.row in ('A');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Side', false
from seatrow, seatnum
where seatnum.num >= 108
and seatnum.num%2 = 0
and seatnum.num <= 114
and seatrow.row in ('A');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Side', false
from seatrow, seatnum
where seatnum.num >= 108
and seatnum.num%2 = 0
and seatnum.num <= 116
and seatrow.row in ('B', 'C', 'D', 'E');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Side', false
from seatrow, seatnum
where seatnum.num >= 108
and seatnum.num%2 = 0
and seatnum.num <= 118
and seatrow.row in ('F', 'G', 'H', 'J');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Side', false
from seatrow, seatnum
where seatnum.num >= 108
and seatnum.num%2 = 0
and seatnum.num <= 120
and seatrow.row in ('K', 'L', 'M', 'N');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Side', false
from seatrow, seatnum
where seatnum.num >= 108
and seatnum.num%2 = 0
and seatnum.num <= 122
and seatrow.row in ('O');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Side', false
from seatrow, seatnum
where seatnum.num = 108
and seatrow.row in ('P', 'Q', 'R');
-- Main Floor, Right
insert into seat(row, num, section, side, pricingtier, wheelchair)
select seatrow.row, seatnum.num, 'Main Floor', 'Right', 'Side', true
from seatrow, seatnum
where seatnum.num >= 110
and seatnum.num%2 = 0
and seatnum.num <= 122
and seatrow.row in ('P', 'Q', 'R');
																																																		
-- Step 5
create table customer (
	customerID int primary key,
	firstname text not null,
	lastname text not null
	);
	
-- Step 6
create table private.customer (
	customerid int primary key references customer(customerid),
	creditcard bigint
	);
	
-- Step 7	
create table ticket(
	ticketnumber serial primary key,
	customerid int references customer(customerid),
	seatrow varchar(2) not null,
	seatnumber int not null,
	showtime timestamp,
	unique (seatrow, seatnumber, showtime)
	);
	
-- Step 8	
insert into customer (firstname, lastname, customerid) values
('Mike', 'Johnson', 1234);

insert into private.customer (customerid, creditcard) values
(1234, 1234567887654321);

insert into ticket (ticketnumber, customerid, seatrow, seatnumber, showtime) values
(default, 1234, 'A', 6, '2017-12-15 14:00');

insert into ticket (ticketnumber, customerid, seatrow, seatnumber, showtime) values
(default, 1234, 'A', 8, '2017-12-15 14:00');

insert into ticket (ticketnumber, customerid, seatrow, seatnumber, showtime) values
(default, 1234, 'A', 10, '2017-12-15 14:00');

insert into ticket (ticketnumber, customerid, seatrow, seatnumber, showtime) values
(default, 1234, 'A', 9, '2017-12-15 14:00');

---------------------------------------------
select count(*);
select * from seat;
select * from ticket;