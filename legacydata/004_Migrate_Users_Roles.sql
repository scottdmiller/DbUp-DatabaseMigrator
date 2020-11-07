DELETE FROM dbo.UsersRoles

SET IDENTITY_INSERT dbo.UsersRoles ON

INSERT INTO dbo.UsersRoles
    (
    Id,
    UserId,
    RoleId,
    CreatedBy,
    CreatedAt
    )
SELECT
    id
    ,userid
    ,CASE
		WHEN rolesid =1 THEN 1 -- Administrator    -> Administrator
		WHEN rolesid =4 THEN 4 -- Tutor            -> Onsite Tutor
		WHEN rolesid =5 THEN 5 -- StudentAssistant -> Student Assistant
		WHEN rolesid =6 THEN 2 -- Client           -> Client
		WHEN rolesid =7 THEN 3 -- TutorOnline      -> Online Tutor 
		ELSE -1
		END AS roleid
    ,0 AS CreatedBy
    ,GETUTCDATE () AS CreatedAt
FROM uwc.dbo.UserRoles
WHERE userid IS NOT NULL
    AND userid IN (SELECT id
    FROM dbo.UWCUsers)

SET IDENTITY_INSERT dbo.UsersRoles OFF