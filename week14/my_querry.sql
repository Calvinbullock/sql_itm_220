
-- ----------------------------------------------------------------- --
-- 1. avg likes / post
-- find the average number of likes per post for each user, but
--      categorize each users based on whether they have any
--      posts with likes. If a user has posts with likes, we'll
--      label them "Active Likers" otherwise, "No Likes"
-- ----------------------------------------------------------------- --
select u.username,
    avg(pl.fk_likes_id) as average_likes,
    case
        when count(pl.fk_likes_id) > 0 then 'active likers'
        else 'no likes'
    end as user_category
from user u
left join post p on u.user_id = p.user_id
left join post_likes pl on p.post_id = pl.fk_post_id
group by u.username;
-- ----------------------------------------------------------------- --
-- 2
-- This query will retrieve user information, their
--      subscription details (start and end dates),
--      and the transaction dates related to their
--      subscriptions.
-- Then store it into a CTE for easy re-query
-- ----------------------------------------------------------------- --
with usersubscriptiontransactions as (
    select u.user_id,
        u.username,
        s.subscription_id,
        s.start_date as subscription_start,
        s.end_date as subscription_end,
        t.transaction_date
    from user u
    join subscription s on u.user_id = s.user_id
    join transaction t on s.subscription_id = t.fk_subscription_id
)
select username,
    subscription_start,
    subscription_end,
    transaction_date
from usersubscriptiontransactions;


