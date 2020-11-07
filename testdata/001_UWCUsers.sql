delete from OnlineTutorials
delete from Tutorials

delete from UsersRoles
delete from UWCUsers

DBCC CHECKIDENT ('UWCUsers', RESEED, 1)
SET IDENTITY_INSERT UWCUsers ON

INSERT INTO [dbo].[UWCUsers] ([Id],[Firstname] ,[Lastname] ,[Email] ,[RegisteredWithUWCDate] ,[IsEnglishFirstLanguage] ,[FirstLanguageNonEnglish] ,[College] ,[AlternateCredentialTypeId] ,[AlternateCredentialKey] ,[BannerId] ,[eRaiderUsername] ,[CreatedBy] ,[CreatedAt] ,[UpdatedBy] ,[UpdatedAt])
VALUES
 (1,'Jane' ,'Doe'      ,NULL ,NULL ,1 ,NULL ,NULL, NULL ,NULL ,NULL ,'Tutor1',1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (2,'Bill' ,'Doe'      ,NULL ,NULL ,1 ,NULL ,NULL, NULL ,NULL ,NULL ,'Tutor2' ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (3,'Ted' ,'Doe'       ,NULL ,NULL ,1 ,NULL ,NULL, NULL ,NULL ,NULL ,'Tutor3' ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (4,'Mrs' ,'Admintoyu' ,NULL ,NULL ,1 ,NULL ,NULL, NULL ,NULL ,NULL, 'Admin1' ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (5,'Ima' ,'Client'    ,NULL ,NULL ,1 ,NULL ,NULL, NULL ,NULL ,NULL ,'Client1'  ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (6,'Imain' ,'Allrolez','ImainAllrolez@test.com' ,NULL ,1 ,NULL ,NULL ,NULL ,NULL ,NULL ,'AllRoles1' ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (7,'Kyle' ,'Nunery','kyle.nunery@clear-measure.com' ,NULL ,1 ,NULL ,NULL ,NULL ,NULL ,NULL ,'knunery' ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (8,'Kenneth' ,'Wilson','email' ,NULL ,1 ,NULL ,NULL ,NULL ,NULL ,NULL ,'wil61532' ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (9,'Robert' ,'Hudson','robert.hudson@ttu.edu' ,NULL ,1 ,NULL ,NULL ,NULL ,NULL ,NULL ,'rhudson' ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (10,'Dustin' ,'Florence','dustinflorence13@gmail.com' ,NULL ,1 ,NULL ,NULL ,NULL ,NULL ,'R00532826' ,NULL ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (11,'Tracy' ,'Givens','tracy.givens@ttu.edu' ,NULL ,1 ,NULL ,NULL ,NULL ,NULL ,NULL ,'tgivens' ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL ),
 (12,'first' ,'last','email' ,NULL ,1 ,NULL ,NULL ,NULL ,NULL ,NULL ,'eraiderusername' ,1 ,CURRENT_TIMESTAMP ,NULL ,NULL )

SET IDENTITY_INSERT UWCUsers OFF

DECLARE @tutorRole INT = (SELECT Id from Roles where RoleName = 'Online Tutor')
DECLARE @clientRole INT = (SELECT Id from Roles where RoleName = 'Client')
DECLARE @administratorRole INT = (SELECT Id from Roles where RoleName = 'Administrator')
DECLARE @studentAssistantRole INT = (SELECT Id from Roles where RoleName = 'Student Assistant')

IF @tutorRole IS NULL
	RAISERROR('Online Tutor not found', 20, -1) WITH LOG
IF @clientRole IS NULL 
	RAISERROR('Student not found', 20, -1) WITH LOG
IF @administratorRole IS NULL 
	RAISERROR('Administrator not found', 20, -1) WITH LOG
IF @studentAssistantRole IS NULL 
	RAISERROR('Student Assistant not found', 20, -1) WITH LOG

INSERT INTO [dbo].[UsersRoles]  ([RoleId] ,[UserId] ,[CreatedBy] ,[CreatedAt] ,[UpdatedBy] ,[UpdatedAt])
VALUES 
(@tutorRole ,1 ,1, CURRENT_TIMESTAMP ,NULL ,NULL),
(@tutorRole ,3 ,1, CURRENT_TIMESTAMP ,NULL ,NULL),
(@administratorRole ,4 ,1, CURRENT_TIMESTAMP ,NULL ,NULL),
(@clientRole ,5 ,1, CURRENT_TIMESTAMP ,NULL ,NULL)

-- Give all of the real users all of the roles
INSERT INTO [WritingCenter].[dbo].[UsersRoles]
select roles.id as roleid, uwcusers.id as userid, 1 as createdBy, getdate() as createdAt, null as updatedby, null as updatedat 
from uwcusers
cross join roles 
where uwcusers.id >= 6 and uwcusers.id <=12
