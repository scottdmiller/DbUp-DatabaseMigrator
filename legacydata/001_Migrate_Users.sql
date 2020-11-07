USE writingcenter

TRUNCATE TABLE onsiteTutorials
TRUNCATE TABLE onlinetutorials
DELETE FROM Tutorials
DBCC CHECKIDENT ('dbo.Tutorials',RESEED, 1)
TRUNCATE TABLE UsersRoles
DELETE FROM uwcusers

DBCC CHECKIDENT ('UWCUsers', RESEED, 1)


SET IDENTITY_INSERT UWCUsers ON
INSERT INTO UWCUsers
	(
	Id
	,eRaiderUsername
	,FirstName
	,LastName
	,Email
	,RegisteredWithUWCDate
	,IsEnglishFirstLanguage
	,FirstLanguageNonEnglish
	,College
	,eraiderId
	,BannerId
	,createdBy
	,CreatedAt
	)
SELECT
	user_id
	,username
	,firstname
	,lastname
	,email
	,register_date
	,CASE eng_lang WHEN 'y' THEN 1 ELSE 0 END
	,first_lang
	,college
	,eraiderid
	,bannerid
	,0
	,CURRENT_TIMESTAMP
FROM uwc..Users

SET IDENTITY_INSERT UWCUsers OFF


