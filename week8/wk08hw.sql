-- Background:
-- You have been hired by BYU-I Air to help sort through the airportdb database.
-- Each week you will receive a file from your manager with questions that
-- need answered by writing queries against the database.
-- This week your manager wants you to get familiar with functions.

-- week 8 questions
USE airportdb;

-- -------------------------------------------------------------------------
-- 1. Put the first and last names of the passengers together.
--    Only show passengers with a single letter as their last name.
--    Your columns will look like the following:
--    | Passenger Name |
-- -------------------------------------------------------------------------
select concat(p.firstname, ' ', p.lastname) as 'Passenger Name'
from passenger p
where LENGTH(p.lastname) = 1;

-- -------------------------------------------------------------------------
-- 2. Locate all passenger names with the letter X in their last name that
--    end in XX. Can use LIKE or REGEXP.
--    Your columns will look like the following:
--    | Passenger Name |
-- -------------------------------------------------------------------------
select concat(p.firstname, ' ', p.lastname) as 'Passenger Name'
from passenger p
where p.lastname like('%XX');

-- -------------------------------------------------------------------------
-- 3. Find the airplane type that contains '747' in the identifier.
--    Print the first 15 characters of the description.
--    Hint: (Use the substring and locate functions)
--    Your columns will look like the following:
--    | Airplane Identifier | Airplane Description |
-- -------------------------------------------------------------------------
select ap.identifier as 'Airplane Identifier',
	substring(ap.description, 1, 15) as 'Airplane Description'
from airplane_type ap
where ap.identifier like('%747%');

-- -------------------------------------------------------------------------------------------------
-- 4. List what each passenger paid for their seat on flight number: AF1837
--    on June 1st, 2015. Show the original price, round the price to the nearest dollar, and floor it.
--    Add a $ sign to all prices.
--    Sort prices from lowest to highest.
--    Format the dates to look like: Feb 28, 2015 3:00:00 PM
--    Columns will look like the following:
--    | Flight Number | Departure Date | Passenger Name | Price | Rounded Price | Floored Price |
-- -------------------------------------------------------------------------------------------------
select f.flightno as 'Flight Number',
	date_format(f.departure, '%b %d, %Y %H:%M:%S') as 'Departure Date',
    concat(p.firstname, ' ', p.lastname) as 'Passenger Name',
	concat('$', b.price) as 'Price',
    concat('$', round(b.price)) as 'Rounded Price',
    concat('$', floor(b.price)) as 'Floored Price '
from flight f
join booking b on b.flight_id = f.flight_id
join passenger p on p.passenger_id = b.passenger_id
where f.flightno = 'AF1837'
	and f.departure like '2015-06-01%'
order by b.price desc;

-- -------------------------------------------------------------------------------------------------
-- 5. Find all flights that have a duration of 20 hours or more.
--    Show hours, how many days and how many years since the flight (Use FLOOR).
--    Sort them by longest flight first.
--    Format the dates to look like: Feb 28, 2015 3:00:00 PM
--    Limit to 10 results.
--    Columns will look like the following:
--    | Departure Date | Arrival Date | Duration in Hours | Duration in Days | Years Since Flight |
-- -------------------------------------------------------------------------------------------------
select date_format(f.departure, '%b %d, %Y %H:%i:%s') as 'Departure Date',
    date_format(f.arrival, '%b %d, %Y %H:%i:%s') as 'Arrival Date',
    timestampdiff(hour, f.departure, f.arrival) as 'Duration in Hours',
    floor(timestampdiff(hour, f.departure, f.arrival) / 24) as 'Duration in Days',
    floor(timestampdiff(year, f.departure, now())) as 'Years Since Flight'
from flight f
where timestampdiff(hour, f.departure, f.arrival) >= 20
order by timestampdiff(hour, f.departure, f.arrival) desc
limit 10;
-- -------------------------------------------------------------------------
-- 6. Assign a row number to each passenger for flight number: AL9073.
--    The flight_id is 93.
--    Your columns will look like the following:
--    | Flight Number | Passenger Name | Row Number |
-- -------------------------------------------------------------------------
-- NOT DONE YET ---- !
select f.flight_number as "Flight Number",
    p.first_name || ' ' || p.last_name as "Passenger Name",
    @row_num := @row_num + 1 as "Row Number"
from booking b
join passenger p on b.passenger_id = p.passenger_id
join flight f on b.flight_id = f.flight_id,
    (select @row_num := 0) as r
where f.flight_id = 93;
