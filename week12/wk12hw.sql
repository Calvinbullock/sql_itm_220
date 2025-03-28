-- Background:
-- You have been hired by BYU-I Air to help sort through the airportdb database.
-- Each week you will receive a file from your manager with questions that
-- need answered by writing queries against the database.
-- This week your manager wants you to understand what views and CTE expressions are.

-- week 12 questions
USE airportdb;

-- ---------------------------------------------------------------------------------
-- 1. Create a view from week 10 question 1 named passengerrewards_view.
--    Make a table based on that view named `passengerrewards`.
--    Provide a select statement that queries the table.
--    DO NOT use a select * statement.
--    The columns should look like the following:
--    | Status | Number of Flights | First Name | Last Name | Departure Month |
-- ---------------------------------------------------------------------------------
create or replace view passengerrewards_view as
select
    case
        when count(b.passenger_id) >= 30 then 'platinum'
        when count(b.passenger_id) >= 20 and count(b.passenger_id) < 30 then 'gold'
        when count(b.passenger_id) >= 10 and count(b.passenger_id) < 20 then 'silver'
        else 'no_status'
    end as "status",
    count(b.passenger_id) as 'number_of_flights',
    p.firstname as 'first_name',
    p.lastname as 'last_name'
from passengerdetails pd
left join passenger p on pd.passenger_id = p.passenger_id
left join booking b on p.passenger_id = b.passenger_id
left join flight f on b.flight_id = f.flight_id
left join airport a_from on f.from = a_from.airport_id
left join airport_geo ag on ag.airport_id = a_from.airport_id
where (pd.country = 'UNITED KINGDOM' and ag.country = 'UNITED KINGDOM')
    or (pd.passenger_id is null and pd.country is null)
    or (pd.passenger_id is null and pd.country = 'UNITED KINGDOM')
group by p.passenger_id, p.firstname, p.lastname, month(f.departure)
order by count(b.passenger_id) desc;

-- drop table if needed
drop table if exists passengerrewards;

-- create new table
create table passengerrewards as
select * from passengerrewards_view;

-- Query statement for new table
select pr.status,
    pr.number_of_flights,
    pr.first_name,
    pr.last_name
    -- Departure Month -- TODO: THIS NEEDS TO BE ADDED??
from passengerrewards pr;

-- --------------------------------------------------------------------------------------------------------
-- 2. What are the top 10 airports that handled the highest number of flights in August?
--    Write a CTE statement called `flight_counts` to find the answer.
--    Columns will look like the following:
--    | Airport | Flight Count |
-- --------------------------------------------------------------------------------------------------------
with flight_counts as (
	select a.name as Airport,
		count(f.from) as 'Flight Count'
	from airport a
    join flight f on a.airport_id = f.from
    where month(f.departure) = '8'
    group by a.name
)
select *
from flight_counts
order by `Flight Count` desc
limit 10;

-- --------------------------------------------------------------------------------------------------------
-- 3. What are the top 5 longest flights by duration for each airline?
--    Don't include any duplicates.
--    Sort the results by airline name and rank.
--    Write a CTE statement called `ranked_flights` to find the answer.
--    Columns will look like the following:
--    | Airline | Flight Number | Origin Airport | Destination Airport | Flight Duration (Minutes) |
-- --------------------------------------------------------------------------------------------------------
with ranked_flights as (
	select distinct al.airlinename as Airline,
		f.flightno as 'Flight_Number',
		a1.name as 'Origin_Airport',
		a2.name as 'Destination_Airport',
		timestampdiff(MINUTE, f.departure, f.arrival) as 'Flight_Duration_(Minutes)',
		DENSE_RANK() OVER (PARTITION BY al.airlinename ORDER BY (SELECT 'Flight_Duration_(Minutes)') DESC) AS 'rank'
	from flight f
	join airline al on al.airline_id = f.airline_id
	join airport a1 on a1.airport_id = f.from
	join airport a2 on a2.airport_id = f.to
)
select rf.Airline as Airline,
		rf.Flight_Number as 'Flight Number',
		rf.Origin_Airport as 'Origin Airport',
		rf.Destination_Airport as 'Destination Airport',
		rf.`Flight_Duration_(Minutes)` as 'Flight Duration (Minutes)'
from ranked_flights rf
where rf.rank <= 5
order by rf.Airline, rf.Origin_Airport, rf.rank;



