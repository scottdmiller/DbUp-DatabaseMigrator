ALTER TABLE dbo.SurveyResponses ADD
    AccessKey uniqueidentifier NULL
GO

UPDATE SurveyResponses SET AccessKey = NEWID()

ALTER TABLE
    SurveyResponses
ALTER COLUMN
    AccessKey uniqueidentifier NOT NULL;

CREATE UNIQUE NONCLUSTERED INDEX [IX_SurveyResponses_AccessKey] ON [dbo].[SurveyResponses]
(
    [AccessKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- Fix typo in Survey Title
UPDATE Surveys SET Title = 'Survey for Online Visit' WHERE Title = 'Survey for Online Vist'
