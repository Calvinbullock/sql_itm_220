-- Background:
-- You have been hired by BYU-I Air to help sort through the airportdb database.
-- Each week you will receive a file from your manager with questions that
-- need answered by writing queries against the database.
-- This week your manager wants you to get familiar with the database.

-- Week 7 questions
USE airportdb;

-- --------------------------------------------------------------------------
-- 1. What are the unique last names of our employees?
--    List them in alphabetical order.
--    Columns will look like the following:
--    | Last Name |
-- --------------------------------------------------------------------------
select distinct lastname as 'last name'
from employee
order by lastname;

-- --------------------------------------------------------------------------
-- 2. What are the airlines and which airports are they based in?
--    List the airlines in alphabetical order.
--    Columns will look like the following:
--    | Airline | Airport |
-- --------------------------------------------------------------------------
select al.airlinename as 'Airline'
, 	ap.name as 'Airport'
from airport ap
join airline al on al.base_airport = ap.airport_id
order by Airline;

-- --------------------------------------------------------------------------
-- 3. What are the first 20 airports that are based in the United States?
--    Display the airport name and country.
--    Columns will look like the following:
--    | Airport | Country |
-- --------------------------------------------------------------------------
select ag.country as Country,
a.name as Airpot
from airport a
join airport_geo ag on ag.name = a.name
where ag.country = 'United States'
limit 20;

-- --------------------------------------------------------------------------
-- 4. What are the top 10 airports without an IATA code?
--    Display the airport name, IATA code, and ICAO code.
--    Columns will look like the following:
--    | Airport | IATA | ICAO |
-- --------------------------------------------------------------------------
select a.name as Airport,
	IATA,
    ICAO
from airport a
where IATA is NULL
limit 10;

-- --------------------------------------------------------------------------
-- 5. What are the flights that depart between 10:00 and 10:15 on Monday?
--    Sort the results by departure time.
--    List the following columns:
--    | Flight Number | Departure Time | Arrival Time | Airline | Monday |
-- --------------------------------------------------------------------------
select fs.flightno as 'Flight Number', 
	fs.departure as 'Departure Time',
    fs.arrival as 'Arrival Time',
    a.airlinename as 'Airline',
    fs.monday as 'Monday'
from flight f
join flightschedule fs on f.flightno = fs.flightno
join airline a on f.airline_id = a.airline_id
where fs.monday = 1 and 
	time(fs.departure) between '10:00' and '10:15'
order by fs.departure;

-- --------------------------------------------------------------------------
-- 6. What are the flights that arrive between 20:00 and 20:15 and are not
--    flown on Monday?
--    Sort the results by departure time.
--    List the following columns:
--    | Flight Number | Departure Time | Arrival Time | Airline | Monday |
-- --------------------------------------------------------------------------
select f.flightno as 'Flight Number',
	fs.departure as 'Departure Time',
    fs.arrival as 'Arrival Time',
    a.airlinename as 'Airline',
    fs.monday as 'Monday'
from flightschedule fs
join flight f on fs.flightno = f.flightno
join airline a on a.airline_id = f.airline_id
where fs.monday = 0 and Time(fs.departure)
	between '20:00' and '20:15'
order by fs.departure;

-- ------------------------------------------------------------------------------------------
-- 7. Marilyn is trying to schedule a flight that departs sometime between
--    3PM and 4PM and arrives between 6PM and 7PM on Wednesday or Thursday.
--    She also wants to avoid flights that are operated by Cyprus Airlines.
--    Can you help her?
--    Sort the results by departure time.
--    List the following columns:
--    | Flight Number | Departure Time | Arrival Time | Airline | Wednesday | Thursday |
--- ------------------------------------------------------------------------------------------
select fs.flightno as 'Flight Number',
	fs.departure as 'Departure Time',
	fs.arrival as 'Arrival Time',
	a.airlinename as 'Airline',
	fs.wednesday as 'Wednesday',
	fs.thursday as 'Thursday'
from flight f
join flightschedule as fs on f.flightno = fs.flightno
join airline a on f.airline_id = a.airline_id
where (TIME(fs.departure) between '15:00' and '16:00') 
	and (TIME(fs.arrival) between '18:00' and '21:00') 
    and (fs.wednesday = 1 or fs.thursday = 1) 
    and (a.airlinename != 'Cyprus Airlines')
order by fs.departure;