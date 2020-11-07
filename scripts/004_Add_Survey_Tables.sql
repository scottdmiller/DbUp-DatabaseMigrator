CREATE TABLE [dbo].[ClientSurvey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientUserId] [int] NULL,
	[TutorialCount] [int] NULL,
	[Modality] [char](6) NOT NULL,
	[SurveyId] [int] NULL,
	[SurveySentDate] [datetime2](7) NULL,
	[SurveyResponseDate] [datetime2](7) NULL,
	[TutorialId] [int] NULL,
	[Notes] [varchar](1000) NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

