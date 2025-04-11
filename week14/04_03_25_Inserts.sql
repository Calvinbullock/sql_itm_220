USE SQL_Monster;

-- ============ --
-- User         --
-- ============ --
INSERT INTO user
    (f_name, l_name, birthdate, username)
VALUES
    ('Luke', 'Skywalker', '2024-07-04', 'Luke_Skywalker'),
    ('Leia', 'Organa', '2023-12-25', 'PrincessLeia'),
    ('Han', 'Solo', '2025-01-01', 'SmugglerHan'),
    ('Chewbacca', 'Chewbacca', '2022-11-11', 'Chewbacca'),
    ('Obi-Wan', 'Kenobi', '1999-09-09', 'OldBen'),
    -- new rows
    ('Anakin', 'Skywalker', '1977-05-25', 'DarthVader'),
    ('Padme', 'Amidala', '1978-06-12', 'SenatorPadme'),
    ('Yoda', 'Yoda', '1000-01-01', 'MasterYoda'),
    ('Lando', 'Calrissian', '2026-02-14', 'LandoSmooth'),
    ('Rey', 'Unknown', '2027-03-15', 'ReyTheScavenger'),
    ('Finn', 'FN-2187', '2028-04-16', 'FinnTheStormtrooper'),
    ('Poe', 'Dameron', '2029-05-17', 'PoeThePilot'),
    ('Rose', 'Tico', '2030-06-18', 'RoseTheMechanic'),
    ('Kylo', 'Ren', '2031-07-19', 'KyloTheSupremeLeader'),
    ('Maz', 'Kanata', '1200-08-20', 'MazThePirate');
-- ============ --
-- post         --
-- ============ --
INSERT INTO post
    (fk_user_id,title,content)
VALUES
    ((SELECT user_id FROM user WHERE f_name = 'Luke' AND l_name ='Skywalker') ,"Morning Meditation","Just completed my morning meditation. The Force is strong today. Remember, no matter how dark it gets, there's always a light waiting to be found. #JediWisdom")
    ,((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Leia Organa') ,"Rebel Victory Celebration","Rebel Alliance victory celebration tonight! Grateful for our incredible team. Let's continue to fight for justice and peace in the galaxy. #ResistanceStrong")
    ,((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Han Solo') ,"Endor Autumn","Found a perfect spot to park the Millennium Falcon on Endor. Fall here is quite something. Now, who’s up for a sabacc game? #SmugglerLife")
    ,((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Obi-Wan Kenobi'),"Wisdom of the Force","Remember, the Force will be with you, always. Focus on the present moment, and trust in your instincts. #JediMaster")
    ,((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Chewbacca Chewbacca'),"Wookiee Nap","Rrrroooaaaarrrr! (Translation: Enjoying some downtime with my buddy Han Solo on Endor. Nothing beats a good Wookiee nap in the shade. #WookieeLife"),

    -- NEW ROWS
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker'),
     "The Power of the Dark Side",
     "I feel the power of the dark side growing stronger. It offers a path to strength and control. #DarthVader"),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala'),
     "Diplomacy and Hope",
     "Even in the darkest times, we must strive for peaceful solutions. There is always hope for a better future. #SenatorAmidala"),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda'),
     "The Force Within",
     "Strong is the Force. But stronger is the mind. Control your emotions, and you will find true strength. #MasterYoda"),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian'),
     "A Deal is a Deal",
     "Just made a sweet deal. Smooth talking and a bit of luck always get the job done. Who needs the Empire when you've got style? #LandoSmooth"),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown'),
     "Finding My Way",
     "Still learning about the Force and my place in all of this. It's a journey, but I won't give up. #ReyTheScavenger"),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187'),
     "Choosing My Path",
     "I'm no longer just a number. I'm choosing my own path, fighting for what's right. #FinnTheStormtrooper"),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron'),
     "Flying High",
     "Just completed another successful mission. Best pilot in the Resistance, no doubt. Let's keep those blasters firing! #PoeThePilot"),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rose Tico'),
     "Engineering Solutions",
     "Working on some new tech to help the Resistance. Let's outsmart the First Order! #RoseTheMechanic"),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Kylo Ren'),
     "The Conflict Within",
     "The pull to the light still lingers, but I will not waver. The dark side will prevail. #KyloTheSupremeLeader"),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Maz Kanata'),
     "Wisdom from the Ages",
     "I have seen many things in my long life. Trust in the Force, and it will guide you. #MazThePirate");

-- ============ --
-- subscription --
-- ============ --
INSERT INTO subscription
    (start_date, end_date, user_id)
VALUES
    ("2024-07-05",NULL, (SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Luke Skywalker'))
,    ("2024-08-10",NULL, (SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Leia Organa'))
,    ("2024-09-15",NULL, (SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Han Solo'))
,    ("2024-10-20",NULL, (SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Obi-Wan Kenobi'))
,    ("2024-11-25",NULL, (SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Chewbacca Chewbacca'))
,    ('2024-12-30',NULL, (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker'))
,    ('2025-01-05','2028-01-04', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala'))
,    ('2025-02-10',NULL,(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda'))
,    ('2025-03-15',NULL,(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian'))
,    ('2025-04-20',NULL,(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown'))
,    ('2025-05-25',NULL,(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187'))
,	 ('2025-06-30',NULL,(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron'))
,    ('2025-07-05',NULL,(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rose Tico'))
,    ('2025-08-10',NULL,(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Kylo Ren'))
,    ('2025-09-15', '2026-03-14',(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Maz Kanata'));

-- ============ --
-- comments     --
-- ============ --
INSERT INTO comments (comment,user_id)
VALUES
    -- new
    ("Use the Force, it's your ally",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker')),
    ("Rebellion is built on hope.", (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa')),
    ("Never tell me the odds!",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo')),
    ("Rrrrwwaagghh!",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca')),
    ("Hello there!",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi')),
    ("I find your lack of faith disturbing.",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker')),
    ("I will not condone a course of action that will lead us to war",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala')),
    ("Do or do not, there is no try.",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda')),
    ("Betrayal? That's just business!",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian')),
    ("I am all the Jedi.",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown')),
    ("I was raised to fight. For the first time I have something to fight for.",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187')),
    ("I can fly anything.",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron')),
    ("That’s how we’re going to win. Not fighting what we hate, saving what we love.",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rose Tico')),
    ("Let the past die. Kill it if you have to.",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Kylo Ren')),
    ("The belonging you seek is not behind you. It is ahead.",(SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Maz Kanata'));

-- ============ --
-- Transactions --
-- ============ --
INSERT INTO transaction (transaction_date, fk_user_id, fk_subscription_id)
VALUES
    ('2024-07-10', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker'))),

    ('2024-08-15', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa'))),

    ('2024-09-20', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo'))),

    ('2024-10-25', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi'))),

    ('2024-11-30', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca'))),

    ('2025-01-10', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker'))),

    ('2025-01-15', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala'))),

    ('2025-02-20', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda'))),

    ('2025-03-25', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian'))),

    ('2025-04-30', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown'))),

    ('2025-05-10', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187'))),

    ('2025-06-15', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron'))),

    ('2025-07-20', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rose Tico'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rose Tico'))),

    ('2025-08-25', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Kylo Ren'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Kylo Ren'))),

    ('2025-09-30', (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Maz Kanata'), (SELECT subscription_id FROM subscription WHERE user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Maz Kanata')));


-- ============ --
-- friendship   --
-- ============ --
INSERT INTO friendship (friend_user_id, user_id)
VALUES
    -- new
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo')),

    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker')),

    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca')),

    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker')),

    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi')),

    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker')),

    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi')),

    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo')),

    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187')),

    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa'));
     
-- ============= --
--     tags      --
-- ============= --
INSERT INTO tag (tagger_user_id, tagged_user_id)
VALUES
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo')),

    -- NEW ROWS
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rose Tico'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Kylo Ren'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa')),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Maz Kanata'),
     (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda'));

-- ============ --
-- likes        --
-- ============ --
INSERT INTO likes (fk_user_id, likes_dislike)
VALUES
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Luke Skywalker'),1),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Leia Organa'),1),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Obi-Wan Kenobi'),0),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Han Solo'),1),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Chewbacca Chewbacca'),0),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Anakin Skywalker'), 1),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Padme Amidala'), 0),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Yoda Yoda'), 1),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Lando Calrissian'), 1),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Rey Unknown'), 0),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Finn FN-2187'), 1),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Poe Dameron'), 1),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Rose Tico'), 0),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Kylo Ren'), 1),
    ((SELECT user_id FROM user WHERE CONCAT(f_name, ' ',l_name) = 'Maz Kanata'), 0);

-- ============ --
-- Post_likes   --
-- ============ --
INSERT INTO post_likes (fk_post_id, fk_likes_id)
VALUES
    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rose Tico')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rose Tico'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Kylo Ren')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Kylo Ren'))),

    ((SELECT post_id FROM post WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Maz Kanata')),
    (SELECT likes_id FROM likes WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Maz Kanata')));

-- ============ --
-- post_tag     --
-- ============ --
INSERT INTO post_tag (fk_post_id, fk_tag_id)
VALUES
    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Obi-Wan Kenobi')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Chewbacca Chewbacca')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo'))),

    -- Additional Inserts for New Data
    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Padme Amidala')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Anakin Skywalker'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Luke Skywalker'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Lando Calrissian')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Han Solo'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa'))),

	((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Poe Dameron')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Finn FN-2187'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rose Tico')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rose Tico')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Rey Unknown'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Kylo Ren')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Kylo Ren')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Leia Organa'))),

    ((SELECT post_id FROM post
      WHERE fk_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Maz Kanata')),
     (SELECT tag_id FROM tag
      WHERE tagger_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Maz Kanata')
        AND tagged_user_id = (SELECT user_id FROM user WHERE CONCAT(f_name, ' ', l_name) = 'Yoda Yoda')));





-- ============= --
-- post_comments --
-- ============= --
INSERT INTO `SQL_Monster`.`post_comments` (`fk_post_id`, `fk_comments_id`)
VALUES
    ((SELECT post_id FROM post WHERE title = "Morning Meditation"),
     (SELECT comment_id FROM comments WHERE comment = "Use the Force, it's your ally")),
    ((SELECT post_id FROM post WHERE title = "Rebel Victory Celebration"),
     (SELECT comment_id FROM comments WHERE comment = "Rebellion is built on hope.")),
    ((SELECT post_id FROM post WHERE title = "Endor Autumn"),
     (SELECT comment_id FROM comments WHERE comment = "Never tell me the odds!")),
    ((SELECT post_id FROM post WHERE title = "Wisdom of the Force"),
     (SELECT comment_id FROM comments WHERE comment = "Hello there!")),
    ((SELECT post_id FROM post WHERE title = "Wookiee Nap"),
     (SELECT comment_id FROM comments WHERE comment = "Rrrrwwaagghh!")),
    ((SELECT post_id FROM post WHERE title = "The Power of the Dark Side"),
     (SELECT comment_id FROM comments WHERE comment = "I find your lack of faith disturbing.")),
    ((SELECT post_id FROM post WHERE title = "Diplomacy and Hope"),
     (SELECT comment_id FROM comments WHERE comment = "I will not condone a course of action that will lead us to war")),
    ((SELECT post_id FROM post WHERE title = "The Force Within"),
     (SELECT comment_id FROM comments WHERE comment = "Do or do not, there is no try.")),
    ((SELECT post_id FROM post WHERE title = "A Deal is a Deal"),
     (SELECT comment_id FROM comments WHERE comment = "Betrayal? That's just business!")),
    ((SELECT post_id FROM post WHERE title = "Finding My Way"),
     (SELECT comment_id FROM comments WHERE comment = "I am all the Jedi.")),
    ((SELECT post_id FROM post WHERE title = "Choosing My Path"),
     (SELECT comment_id FROM comments WHERE comment = "I was raised to fight. For the first time I have something to fight for.")),
    ((SELECT post_id FROM post WHERE title = "Flying High"),
     (SELECT comment_id FROM comments WHERE comment = "I can fly anything.")),
    ((SELECT post_id FROM post WHERE title = "Engineering Solutions"),
     (SELECT comment_id FROM comments WHERE comment = "That’s how we’re going to win. Not fighting what we hate, saving what we love.")),
    ((SELECT post_id FROM post WHERE title = "The Conflict Within"),
     (SELECT comment_id FROM comments WHERE comment = "Let the past die. Kill it if you have to.")),
    ((SELECT post_id FROM post WHERE title = "Wisdom from the Ages"),
     (SELECT comment_id FROM comments WHERE comment = "The belonging you seek is not behind you. It is ahead."));


-- ============= --
-- messages --
-- ============= --
INSERT INTO `SQL_Monster`.`messages` (`fk_user_id_1`, `fk_user_id_2`, `message_content`) VALUES
    (1, 2, 'Hey, how are you doing?'),
    (2, 1, 'I am doing well, thanks! How about you?'),
    (1, 3, 'Do you want to play a game later?'),
    (3, 1, 'Sure, what game?'),
    (2, 3, 'I need some help with a quest.'),
    (3, 2, 'Okay, I can help. Which quest is it?'),
    (4, 1, 'Is anyone online?'),
    (1, 4, 'Yes, I am here.'),
    (5, 2, 'When is the next raid?'),
    (2, 5, 'It\'s scheduled for tomorrow at 8 PM.'),
    (3, 4, 'I found a rare item!'),
    (4, 3, 'Wow, what is it?'),
    (1, 5, 'Can you trade me some gold?'),
    (5, 1, 'How much do you need?'),
    (2, 4, 'Looking for a party for the dungeon.'),
    (4, 2, 'I\'m available!'),
    (6, 1, 'New player here, any tips?'),
    (1, 6, 'Welcome! Focus on leveling up your main skills.'),
    (3, 5, 'Anyone know where to find the legendary sword?'),
    (5, 3, 'It\'s in the hidden cave near the mountain.'),
    (4, 6, 'I need help defeating a boss.'),
    (6, 4, 'Which boss is it?'),
    (1, 2, 'Remember that time we fought the dragon?'),
    (2, 1, 'Yeah, that was intense!'),
    (2, 6, 'Do you want to join our guild?'),
    (6, 2, 'Sure, how do I join?'),
    (5, 4, 'Is anyone selling rare potions?'),
    (4, 5, 'I have some, what are you looking for?'),
    (3, 1, 'Lets go explore the new area.'),
    (1, 3, 'Sounds like fun!'),
    (6, 3, 'What is the best way to get skill points?'),
    (3, 6, 'Completing quests and defeating monsters.'),
    (4, 1, 'I just crafted a powerful weapon!'),
    (1, 4, 'That\'s awesome! What kind of weapon?'),
    (2, 5, 'I found a secret passage.'),
    (5, 2, 'Where does it lead?'),
    (5, 6, 'Anyone want to trade items?'),
    (6, 5, 'What items are you trading?'),
    (1, 6, 'How do I change my character\'s appearance?'),
    (6, 1, 'Go to the character customization menu.'),
    (3, 2, 'I am trying to complete the fishing quest.'),
    (2, 3, 'Use the special bait near the lake.'),
    (4, 3, 'Does anyone know the best farming spots?'),
    (3, 4, 'The fields near the river are good.'),
    (2, 1, 'I am looking for a healer for our raid.'),
    (1, 2, 'I can heal if you need.'),
    (6, 4, 'How do I level up my pet?'),
    (4, 6, 'Feed it regularly and use pet training items.'),
    (5, 1, 'Where can I find rare crafting materials?'),
    (1, 5, 'Check the high-level zones.'),
    (3, 6, 'What are the daily quests?'),
    (6, 3, 'Check the quest board in the main city.'),
    (4, 2, 'I just got a legendary drop!');
    



-- ============= --
--  post_tags    --
-- ============= --
