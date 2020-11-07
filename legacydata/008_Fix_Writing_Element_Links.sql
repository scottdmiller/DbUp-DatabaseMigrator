UPDATE onlineTutorials
SET tutorCritique = REPLACE (tutorCritique , 'read_element.asp?', '/writingelements?')
WHERE tutorcritique like '%read_element%'

-- Some Tutor Critiques have line breaks after the question marks so updating serial_no separately.
UPDATE onlineTutorials
SET tutorCritique = REPLACE (tutorCritique , 'serial_no=', 'id=')
WHERE tutorcritique like '%serial_no%'

-- One off fix for malformed data
UPDATE onlineTutorials
SET tutorCritique = REPLACE (tutorCritique , 'Aid=141', 'id=141')
WHERE Id = 13871 AND tutorCritique like '%Aid=141%'