select concat(u.f_name, ' ', u.l_name) as 'User Name',
from user u
join post p
    on p.fk_user_id = u.user_id
join post_comments pc
    on pc.fk_post_id = p.post_id
join comment c
    on c.comment_id = fk_comments_id
where u.user_id = 1
limit 5;

