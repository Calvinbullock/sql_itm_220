-- Background:
-- You have been hired by BYU-I Air to help sort through the airportdb database.
-- Each week you will receive a file from your manager with questions that
-- need answered by writing queries against the database.
-- This week your manager wants you to understand case statements.

-- week 9 questions
USE airportdb;

-- ---------------------------------------------------------------------------
-- 1. What are the flight details for flight AL9073 (flight id #93)?
--    Format the dates to look like: Jun 01, 2015 07:56 AM
--    The From and To columns should display the city and country together.
--    The columns should look like the following:
--    | Flight Number | From | To | Departure Date | Arrival Date |
-- ---------------------------------------------------------------------------
select f.flightno as 'Flight Number',
	concat(ag1.city, ' ', ag1.country) as 'From',
	concat(ag2.city, ' ', ag2.country) as 'To',
    date_format(f.departure, '%b %d, %Y %h:%i %p') AS 'Departure Date',
    date_format(f.arrival, '%b %d, %Y %h:%i %p') AS 'Arrival Date'
from flight f
	join airport a1 on a1.airport_id = f.from
	join airport a2 on a2.airport_id = f.to
    join airport_geo ag1 on ag1.airport_id = a1.airport_id
    join airport_geo ag2 on ag2.airport_id = a2.airport_id
where f.flight_id = '93';

-- ---------------------------------------------------------------------------
-- 2. How many passengers are on flight AL9073 (flight id #93)?
--    Tell me whether or not the flight is full.
--    Code an example with seats available and when it is full
--    This should be done in one query.
--    A `group by` clause shouldn't be used.
--    The columns should look like the following:
--    | Flight Number | From | To | Plane Capacity | Original # of Passengers | Seats Remaining | Full Flight # of Passengers | Seats Remaining |
-- ---------------------------------------------------------------------------
select f.flightno as 'Flight Number',
	concat(ag1.city, ' ', ag1.country) as 'From',
	concat(ag2.city, ' ', ag2.country) as 'To',
	ap.capacity as 'Plane Capacity',
	count(b.passenger_id) as 'Original # of Passengers',
	case
        when ap.capacity > count(b.passenger_id)
		then concat(ap.capacity - count(b.passenger_id), ' ', 'seats left')
        else 'full flight'
     end as 'Seats Remaining',
    ap.capacity as 'Full Flight # of Passengers',
	case
        when ap.capacity > count(b.passenger_id) + 25
		then concat(ap.capacity - count(b.passenger_id), ' ', 'seats left')
        else 'full flight'
     end as 'Seats Remaining'
from flight f
	-- city / country location joins
	join airport a1 on a1.airport_id = f.from
	join airport a2 on a2.airport_id = f.to
    join airport_geo ag1 on ag1.airport_id = a1.airport_id
    join airport_geo ag2 on ag2.airport_id = a2.airport_id
	-- plane details joins
    join airplane ap on ap.airplane_id = f.airplane_id
    -- count seats
    join booking b on b.flight_id = f.flight_id
where f.flight_id = '93'
	and f.flightno = 'AL9073';

-- -------------------------------------------------------------------------------------
-- 3. How many flights are on each day that are contained within the U.S.?
--    These flights depart from a city in the U.S. and arrives at a U.S. city
--    Also display the total amount of flights at the end
--    The columns should look like the following:
--    | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday | Total |
-- -------------------------------------------------------------------------------------
-- TODO: the nums are not right, should be mostly in the hundreads but in the thousands...
select sum(case when dayofweek(f.departure) = 2 then 1 else 0 end) as monday,
    sum(case when dayofweek(f.departure) = 3 then 1 else 0 end) as tuesday,
    sum(case when dayofweek(f.departure) = 4 then 1 else 0 end) as wednesday,
    sum(case when dayofweek(f.departure) = 5 then 1 else 0 end) as thursday,
    sum(case when dayofweek(f.departure) = 6 then 1 else 0 end) as friday,
    sum(case when dayofweek(f.departure) = 7 then 1 else 0 end) as saturday,
    sum(case when dayofweek(f.departure) = 1 then 1 else 0 end) as sunday,
    count(`monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`) as total
from flight f
	-- city / country location joins
	-- 1
    join airport a1 on a1.airport_id = f.from
    join airport_geo ag1 on ag1.airport_id = a1.airport_id
    -- 2
    join airport a2 on a2.airport_id = f.to
    join airport_geo ag2 on ag2.airport_id = a2.airport_id
where ag1.country = 'United States'
    and ag2.country = 'United States';

-- ---------------------------------------------------------------------------
--    YOU MAY NEED TO RUN THIS QUERY FROM THE TERMINAL TO VERIFY THAT IT WORKS
-- 4. List the number of passengers each flight serviced within the U.S.
--    Sort by total number of passengers from greatest to least
--    The activity column consists of a case statement with the
--    following conditions:
--    - If 10,000 or more, state "High Activity"
--    - If between 5,000 and 10,000, state "Moderate Activity"
--    - If between 1,000 and 5,000, state "Low Activity"
--    - If less than 1,000, state "Very Low Activity"
--    The columns should look like the following:
--    | Flight Number | From | To | Activity | Number of Passengers |
-- ---------------------------------------------------------------------------
-- TODO: not done
select f.flightno as `Flight Number`,
	concat(ag1.city, ' ', ag1.country) as 'From',
	concat(ag2.city, ' ', ag2.country) as 'To',
    case
        when count(p.passenger_id) >= 10000 then 'High Activity'
        when count(p.passenger_id) >= 5000 then 'Moderate Activity'
        when count(p.passenger_id) >= 1000 then 'Low Activity'
        else 'Very Low Activity'
    end as `Activity`,
    count(p.passenger_id) as `Number of Passengers`
from flights f
	-- city / country location joins
	join airport a1 on a1.airport_id = f.from
	join airport a2 on a2.airport_id = f.to
    join airport_geo ag1 on ag1.airport_id = a1.airport_id
    join airport_geo ag2 on ag2.airport_id = a2.airport_id
    -- passenger count
    join passengers p on f.flight_id = p.flight_id
where ag1.country = 'United States'
    and ag2.country = 'United States'
group by f.flight_no, ag1.city, ag2.city
order by `Number of Passengers` desc;

