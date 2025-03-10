-- count how many messages every user has
SELECT u.username,
    COUNT(m.messages_id) AS message_count
FROM user u
LEFT JOIN messages m ON u.user_id = m.fk_user_id
GROUP BY u.username;
