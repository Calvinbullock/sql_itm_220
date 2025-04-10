-- Background:
-- You have been hired by BYU-I Air to help sort through the airportdb database.
-- Each week you will receive a file from your manager with questions that
-- need answered by writing queries against the database.
-- This week your manager wants you to understand left joins.

-- week 10 questions
USE airportdb;

-- ---------------------------------------------------------------------------
-- 1. Who are our frequent fliers that reside in the U.K. and have flown
--    somewhere in the world from the U.K.?
--    We want to see all passengers regardless of whether they have flown.
--    Show their status as 'Platinum', 'Gold', 'Silver', or 'No Status'
--    based on the number of flights they have taken.
--    The conditions are as follows
--    - Platinum: 30 or more flights
--    - Gold: 20 or more flights
--    - Silver: 10 or more flights
--    - No Status: Less than 10 flights
--    List the number of flights they have taken.
--    Group by departure month.
--    Hint: You will have three AND compound WHERE clause conditions separated
--    by two OR operators.
--    The columns should look like the following:
--    | Status | Number of Flights | First Name | Last Name |
-- ---------------------------------------------------------------------------
select
    case
        when count(b.passenger_id) >= 30 then 'platinum'
		when count(b.passenger_id) >= 20 and count(b.passenger_id) < 30 then 'gold'
        when count(b.passenger_id) >= 10 and count(b.passenger_id) < 20 then 'silver'
        else 'no status'
    end as "status",
    count(b.passenger_id) as 'number of flights',
    p.firstname as 'first name',
    p.lastname as 'last name'
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

-- --------------------------------------------------------------
-- 2. Who in the 'no status' section from the previous query
--    have never flown?
--    Columns will look like the following:
--    | Status | Number of Flights | First Name | Last Name |
-- --------------------------------------------------------------
select
    case
        when count(b.passenger_id) >= 30 then 'platinum'
		when count(b.passenger_id) >= 20 and count(b.passenger_id) < 30 then 'gold'
        when count(b.passenger_id) >= 10 and count(b.passenger_id) < 20 then 'silver'
        else 'no status'
    end as 'status',
    count(b.passenger_id) as 'number of flights',
    p.firstname as 'first name',
    p.lastname as 'last name'
from passenger p
left join passengerdetails pd on pd.passenger_id = p.passenger_id
left join booking b on p.passenger_id = b.passenger_id
left join flight f on b.flight_id = f.flight_id
left join airport a_from on f.from = a_from.airport_id
left join airport_geo ag on ag.airport_id = a_from.airport_id
where (pd.country = 'UNITED KINGDOM' and ag.country = 'UNITED KINGDOM')
	or (b.passenger_id is null and pd.country is null)
    or (b.passenger_id is null and pd.country = 'UNITED KINGDOM')
group by p.firstname, p.lastname, month(f.departure)
having `status` = 'no status' and `number of flights` = 0
order by count(b.passenger_id) desc;

-- --------------------------------------------------------------------------------
-- 3. Who has never flown and doesn't have any records in our
--    passenger details table?
--    | Status | Number of Flights | First Name | Last Name | Passenger Country |
-- --------------------------------------------------------------------------------
select
    case
        when count(b.passenger_id) >= 30 then 'platinum'
		when count(b.passenger_id) >= 20 and count(b.passenger_id) < 30 then 'gold'
        when count(b.passenger_id) >= 10 and count(b.passenger_id) < 20 then 'silver'
        else 'no status'
    end as 'status',
    count(b.passenger_id) as 'number of flights',
    p.firstname as 'first name',
    p.lastname as 'last name'
from passenger p
left join passengerdetails pd on pd.passenger_id = p.passenger_id
left join booking b on p.passenger_id = b.passenger_id
left join flight f on b.flight_id = f.flight_id
left join airport a_from on f.from = a_from.airport_id
left join airport_geo ag on ag.airport_id = a_from.airport_id
where (b.passenger_id is null and pd.country is null)
group by p.firstname, p.lastname, month(f.departure)
having `status` = 'no status'
order by count(b.passenger_id) desc;
