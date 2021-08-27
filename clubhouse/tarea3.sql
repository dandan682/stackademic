SELECT rooms.id, rooms.name AS room_name, clubs.name AS club_name,
/* */
(
    SELECT json_agg(participant)
    FROM (
        SELECT participants.user_id, participants.role, users.name
        FROM participants
        INNER JOIN users
            ON participants.user_id = users.id
        WHERE participants.room_id = rooms.id
            AND participants.role IN ('HOST', 'MODERATOR', 'SPEAKER')
        LIMIT 6
    ) participant
) AS panel,
/*  */
COUNT(participants.user_id) FILTER (
    WHERE participants.room_id = rooms.id
        AND participants.role != 'AUDIENCE'
) AS panel_count,

COUNT(participants.user_id) FILTER (
    WHERE participants.room_id = rooms.id
) AS participant_count

FROM clubs
RIGHT JOIN rooms 
    ON rooms.club_id = clubs.id

INNER JOIN participants
    ON participants.room_id = rooms.id

GROUP BY rooms.id, rooms.name, clubs.name
ORDER BY rooms.date DESC
;