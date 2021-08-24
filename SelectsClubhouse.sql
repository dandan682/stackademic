SELECT rooms.id, rooms.name, clubs.name AS club_name,
(
    SELECT json_agg(participant)
    FROM (
        SELECT participants.user_id, participants.role
        FROM participants
        WHERE participants.room_id = rooms.id
    ) participant
) AS panel
FROM clubs
RIGHT JOIN rooms ON rooms.club_id = clubs.id;

SELECT rooms.id, rooms.name, clubs.name AS club_name,
(
    SELECT json_agg(participant)
    FROM (
        SELECT participants.user_id, participants.role
        FROM participants
        WHERE participants.room_id = rooms.id
    ) participant
) AS panel
FROM rooms
LEFT JOIN clubs ON rooms.club_id = clubs.id;



/* ================================================================================ */
/* Question 1: How many rooms does the club "Hail our AI Overlords" have?           */
/* Answer: 3 rooms                                                                  */
/* ================================================================================ */
SELECT c.name AS club_name, r.name AS room_name                                  
FROM clubs c, rooms r                                                            
WHERE c.name = 'Hail our AI Overlords' AND r.club_id = c.id                      
ORDER BY r.id                                                                    
;                                                                                
/* ================================================================================ */
/* Question 2: Which rooms has  John Wick as a participant?                         */
/* Answer: "Achieving impossible tasks" and "Strength Training for MMA"             */
/* ================================================================================ */
SELECT r.id AS room_id, r.name AS room_name, u.name AS participant               
FROM rooms r, participants p, users u                                            
WHERE u.name = 'John Wick' AND r.id = p.room_id AND p.user_id = u.id             
ORDER BY r.id                                                                    
;                                                                                
/* ================================================================================ */
/* Question 3: How many followers does the club "The council of ricks" have?        */
/* Answer: 4 followers                                                              */
/* ================================================================================ */
SELECT c.name AS club_name, u.name AS follower_name                              
FROM clubs c, followers f, users u                                               
WHERE c.name = 'The Council of Ricks' AND f.club_id = c.id AND f.user_id = u.id  
ORDER BY u.name                                                                  
;                                                                                
/* ================================================================================ */
/* Question 4: How many clubs is Elon Musk following?                               */
/* Answer: 3 clubs                                                                  */
/* ================================================================================ */
SELECT c.name AS club_name, u.name AS follower_name                              
FROM clubs c, followers f, users u                                               
WHERE u.name = 'Elon Musk' AND f.user_id = u.id AND c.id = f.club_id             
ORDER BY c.name                                                                  
;             
