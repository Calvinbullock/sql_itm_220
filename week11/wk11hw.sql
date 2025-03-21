-- Background:
-- You have been hired by BYU-I Air to help sort through the airportdb database.
-- Each week you will receive a file from your manager with questions that
-- need answered by writing queries against the database.
-- This week your manager wants you to understand the possibilities of using aggregate functions.

-- week 11 questions
USE airportdb;

-- ---------------------------------------------------------------------------
-- 1. What are the earliest and latest flights that depart from the U.K.?
--    How many months of data do we have for those flights?
--    The columns should look like the following:
--    | Earliest Departure | Latest Departure | Number of Months | From | To |
-- ---------------------------------------------------------------------------
select min(f.departure) as 'Earliest Departure',
	max(f.departure) as 'Latest Departure',
    round(datediff(max(f.departure), min(f.departure)) / 30) as 'Number of Months',
	concat(ag1.city, ' ', ag1.country) as 'From',
	concat(ag2.city, ' ', ag2.country) as 'To'
from flight f
	-- from
	join airport a1 on f.from = a1.airport_id
    join airport_geo ag1 on a1.airport_id = ag1.airport_id
    -- to
    join airport a2 on f.to = a2.airport_id
    join airport_geo ag2 on a2.airport_id = ag2.airport_id
where ag1.country = 'United Kingdom' and ag2.country = 'United Kingdom'
group by concat(ag1.city, ' ', ag1.country), concat(ag2.city, ' ', ag2.country);

-- ---------------------------------------------------------------------------------
-- 2. What is the total number of passengers that are on a flight
--    within the U.K.?
--    The columns should look like the following:
--    | Total Number of Passengers | From | To | Departure Date | Flight Number |
-- --------------------------------------------------------------------------------
select count(b.passenger_id) as "Total Number of Passengers",
	concat(ag1.city, ' ', ag1.country) as 'From',
	concat(ag2.city, ' ', ag2.country) as 'To',
    f.departure as 'Departure Date',
    f.flightno as 'Flight Number'
from flight f
	join booking b on b.flight_id = f.flight_id
	-- from
	join airport a1 on f.from = a1.airport_id
    join airport_geo ag1 on a1.airport_id = ag1.airport_id
    -- to
    join airport a2 on f.to = a2.airport_id
    join airport_geo ag2 on a2.airport_id = ag2.airport_id
where ag1.country = 'United Kingdom' and ag2.country = 'United Kingdom'
group by concat(ag1.city, ' ', ag1.country),
	concat(ag2.city, ' ', ag2.country),
    f.departure, f.flightno
order by f.departure;

-- ---------------------------------------------------------------------------------
-- 3. What is the total revenue generated from flights within the U.K.?
--    Format the revenue with a dollar sign, comma at the thousands place and
--    rounded to 2 decimal places.
--    The columns should look like the following:
--    | Total Revenue | From | To | Flight Number |
-- ---------------------------------------------------------------------------------
select concat('$', format(sum(b.price), 'C')) as 'Total Revenue',
	concat(ag1.city, ' ', ag1.country) as 'From',
	concat(ag2.city, ' ', ag2.country) as 'To',
    f.flightno as 'Flight Number'
from flight f
	join booking b on b.flight_id = f.flight_id
	-- from
	join airport a1 on f.from = a1.airport_id
    join airport_geo ag1 on a1.airport_id = ag1.airport_id
    -- to
    join airport a2 on f.to = a2.airport_id
    join airport_geo ag2 on a2.airport_id = ag2.airport_id
where ag1.country = 'United Kingdom' and ag2.country = 'United Kingdom'
group by f.from, f.to, f.flightno;

-- ---------------------------------------------------------------------------------
-- 4. What is the average revenue above $250 generated from flights within the U.K.?
--    Format the revenue with a dollar sign, comma at the thousands place and
--    rounded to 2 decimal places.
--    The columns should look like the following:
--    | Average Revenue | From | To | Flight Number |
-- ---------------------------------------------------------------------------------
select concat('$', format(avg(b.price), 'C')) as 'Average Revenue',
	concat(ag1.city, ' ', ag1.country) as 'From',
	concat(ag2.city, ' ', ag2.country) as 'To',
    f.flightno as 'Flight Number'
from flight f
	join booking b on b.flight_id = f.flight_id
	-- from
	join airport a1 on f.from = a1.airport_id
    join airport_geo ag1 on a1.airport_id = ag1.airport_id
    -- to
    join airport a2 on f.to = a2.airport_id
    join airport_geo ag2 on a2.airport_id = ag2.airport_id
where ag1.country = 'United Kingdom' and ag2.country = 'United Kingdom'
group by f.from, f.to, f.flightno
having avg(b.price) > 250;

-- ---------------------------------------------------------------------------------------------------------
-- 5. List the number of passengers each flight serviced within the U.S.
--    Sort by total number of passengers from greatest to least
--    The activity column consists of a case statement with the
--    following conditions:
--    - If 10,000 or more, state "High Activity"
--    - If between 5,000 and 10,000, state "Moderate Activity"
--    - If between 1,000 and 5,000, state "Low Activity"
--    - If less than 1,000, state "Very Low Activity"
--    Add the total revenue generated from each flight and average cost per passenger
--    formatted with the following:
--    - Dollar sign
--    - Comma at the thousands place
--    - Rounded to 2 decimal places
--    The columns should look like the following:
--    | Flight Number | From | To | Activity | Number of Passengers | Total Revenue | Average Revenue |
-- ---------------------------------------------------------------------------------------------------------
select f.flightno as 'Flight Number',
	concat(ag1.city, ' ', ag1.country) as 'From',
	concat(ag2.city, ' ', ag2.country) as 'To',
	CASE
        WHEN count(b.passenger_id) >= 10000 THEN 'High Activity'
        WHEN count(b.passenger_id) >= 5000 THEN 'Moderate Activity'
        WHEN count(b.passenger_id) >= 1000 THEN 'Low Activity'
        ELSE 'Very Low Activity'
    END as 'Activity',
    SUM(b.passenger_id) AS 'Number of Passengers',
    concat('$', format(sum(b.price), 'C')) as 'Total Revenue',
    concat('$', format(avg(b.price), 'C')) as 'Average Revenue'
from flight f
	join booking b on b.flight_id = f.flight_id
	-- from
	join airport a1 on f.from = a1.airport_id
    join airport_geo ag1 on a1.airport_id = ag1.airport_id
    -- to
    join airport a2 on f.to = a2.airport_id
    join airport_geo ag2 on a2.airport_id = ag2.airport_id
where ag1.country = 'United States' and ag2.country = 'United States'
group by concat(ag1.city, ' ', ag1.country),
	concat(ag2.city, ' ', ag2.country), f.flightno
order by count(b.passenger_id) desc;
