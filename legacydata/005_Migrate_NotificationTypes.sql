SET IDENTITY_INSERT dbo.[TutorTimeNotificationTypes] ON

INSERT INTO [dbo].[TutorTimeNotificationTypes]
  (
  [Id]
  ,[Name]
  ,[Description]
  ,[EmailTemplate]
  ,[EmailSubject]
  )
SELECT [id]
      ,[typeCode] AS Name
      ,[typeDescription] AS Description
      ,[emailTemplate]
      ,[emailSubject]
FROM [uwc].[dbo].[notificationType]

SET IDENTITY_INSERT dbo.[TutorTimeNotificationTypes] OFF