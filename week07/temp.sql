-- Get all of User Luke Skywalkers posts:
-- First Name | User ID | Post Title | Post Content
select u.f_name AS 'First Name',
    u.user_id AS 'User ID',
    p.title AS 'Post Tile',
    p.content AS 'Post Content'
from user u
join post p on u.user_id = p.fk_user_id
where u.f_name = 'Luke'and u.l_name = 'Skywalker';
