SET IDENTITY_INSERT dbo.[Pages] ON

INSERT INTO [dbo].[Pages]
  (
  [Id]
  ,[Title]
  ,[Slug]
  ,[Html]
  ,[CreatedBy]
  ,[CreatedAt]
  )
SELECT [id]
  ,[pageName]
  ,[pageName]
  ,[sectionText]
  ,0 AS CreatedBy
  ,[Update_Stamp] AS CreatedAt
FROM [uwc].[dbo].[EditableText]

SET IDENTITY_INSERT dbo.[Pages] OFF

UPDATE Pages SET Slug = 'default',Title='Welcome' WHERE Slug = 'default'
UPDATE Pages SET Slug = 'hours',Title='Hours' WHERE Slug = 'hours'
UPDATE Pages SET Slug = 'onsite-tutorials',Title='Onsite Tutorials' WHERE Slug = 'onsite_tutorials'
UPDATE Pages SET Slug = 'writing-resources',Title='Writing Resources' WHERE Slug = 'writingResources'
UPDATE Pages SET Slug = 'about-us',Title='About Us' WHERE Slug = 'aboutUs'
UPDATE Pages SET Slug = 'uwc-history',Title='UWC History' WHERE Slug = 'uwcHistory'
UPDATE Pages SET Slug = 'mission-statement',Title='Mission Statement' WHERE Slug = 'missionStatement'
UPDATE Pages SET Slug = 'contact-us',Title='Contact Us' WHERE Slug = 'contactUS'
UPDATE Pages SET Slug = 'faculty-resources',Title='Faculty Resources' WHERE Slug = 'facultyResources'
UPDATE Pages SET Slug = 'dissertation-resources',Title='Dissertation Resources' WHERE Slug = 'dissertationResources'
UPDATE Pages SET Slug = 'client-menu',Title='Client Menu' WHERE Slug = 'client_menu'
UPDATE Pages SET Slug = 'gswc-default',Title='GSWC Default' WHERE Slug = 'gswc_default'
UPDATE Pages SET Slug = 'gswc-mission',Title='GSWC Mission' WHERE Slug = 'gswc_mission'
UPDATE Pages SET Slug = 'gswc-workshops',Title='GSWC Workshops' WHERE Slug = 'gswc_workshops'
UPDATE Pages SET Slug = 'gswc-faq',Title='GSWC FAQ' WHERE Slug = 'gswc_faq'
UPDATE Pages SET Slug = 'gswc-appointments',Title='GSWC Appointments' WHERE Slug = 'gswc_appointments'
UPDATE Pages SET Slug = 'survey-onsite-one-list-tutor',Title='Survey Onsite One List Tutor' WHERE Slug = 'survey_onsite_one_list_tutor'
UPDATE Pages SET Slug = 'literacy-resources',Title='Literary Resources' WHERE Slug = 'literacyResources'
UPDATE Pages SET Slug = 'summer-workshops',Title='Summer Workshops' WHERE Slug = 'summerworkshops'
UPDATE Pages SET Slug = 'writing-groups',Title='Writing Groups' WHERE Slug = 'fallwritinggroups'
UPDATE Pages SET Slug = 'workshops',Title='Workshops' WHERE Slug = 'workshops'
