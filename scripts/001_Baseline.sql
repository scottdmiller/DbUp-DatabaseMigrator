CREATE TABLE [dbo].[AcademicTermCodes](
	[TermCode] [char](6) NOT NULL,
	[Season] [varchar](15) NOT NULL,
	[TermYear] [char](4) NOT NULL,
	[Semester] [char](4) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[TermCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminEvaluationOfTutorCritiques](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OnlineTutorialId] [int] NOT NULL,
	[EvaluativeText] [varchar](max) NULL,
	[ThisCommenterUserId] [int] NOT NULL,
	[EvaluationDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendars](
	[CalendarDate] [datetime2](7) NOT NULL,
	[IsWeekday] [bit]  NULL,
	[IsHoliday] [bit]  NULL,
	[CalendarYear] [smallint]  NULL,
	[FiscalYear] [smallint]  NULL,
	[Quarter] [tinyint]  NULL,
	[CalendarMonth] [tinyint]  NULL,
	[CalendarDay] [tinyint]  NULL,
	[DayOfWeekNumber] [tinyint]  NULL,
	[MonthName] [varchar](9)  NULL,
	[DayName] [varchar](9)  NULL,
	[CalendarWeek] [tinyint]  NULL,
	[Semester] [char](4) NULL,
PRIMARY KEY CLUSTERED
(
	[CalendarDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassYears](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [char](2) NOT NULL UNIQUE,
	[Name] [varchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineTutorials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsCourseWritingIntensive] [bit] NULL,
	[IsFirstOnlineSubmission] [bit] NULL,
	[DraftTitle] [varchar](500) NULL,
	[DraftDescription] [varchar](max) NULL,
	[DraftText] [varchar](max) NULL,
	[TextFromClientDraftFile] [varchar](max) NULL,
	[ClientDraftFilename] [varchar](8000) NULL,
	[ClientDraftFileSize] [int] NULL,
	[ClientDraftFileExtension] [varchar](5) NULL,
	[UWCSystemFilename] [varchar](8000) NULL,
	[SubmissionWorkflowStepId] [int] NOT NULL,
	[DraftSubmitDate] [datetime2](7) NULL,
	[ClientAssignmentDueDate] [datetime2](7) NOT NULL,
	[AssignedToTutorDate] [datetime2](7) NULL,
	[DueFromTutorDate] [datetime2](7) NULL,
	[HoursRemainingNotifyTutorDate] [datetime2](7) NULL,
	[HoursRemainingTutorNotifiedDate] [datetime2](7) NULL,
	[OverdueFromTutorDate] [datetime2](7) NULL,
	[CompletedByTutorDueDate] [datetime2](7) NULL,
	[CritiquedByTutorDate] [datetime2](7) NULL,
	[ClientReadCritiqueDate] [datetime2](7) NULL,
	[TutorCritique] [varchar](max) NULL,
	[TutorEstimatedTimeToComplete] [int] NULL,
	[TutorActualTimeToComplete] [int] NULL,
	[ClientRequestedTutorTime] [int] NULL,
	[ClientTimeSpentWriting] [varchar](50) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DraftTutorFocus] [varchar](max) NULL,
	[PreferredTutorUserId] [int] NULL,
	[TutorialId] [int] NOT NULL,
 CONSTRAINT [PK__OnlineTu__3214EC076C2DB76D] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnsiteTutorials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsCourseWritingIntensive] [bit] NULL,
	[TutorialDate] [datetime2](7) NULL,
	[HadAppointment] [bit] NOT NULL,
	[TutorComments] [varchar](max) NULL,
	[GraduateOrUndergraduate] [varchar](10) NOT NULL,
	[AssignmentTitle] [varchar](100) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[TutorialId] [int] NOT NULL,
	[TutorialTime] [varchar](50) NULL,
 CONSTRAINT [PK__OnsiteTu__3214EC07D9B07647] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Slug] [varchar](200) NOT NULL,
	[Html] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [char](4) UNIQUE NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[AcademicTermCode] [char](6) NOT NULL,
	[IsCurrentSemester] [bit] NOT NULL DEFAULT(0)
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX IX_Semesters ON dbo.Semesters
	(SemesterName) 
	WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SemesterWeeks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WeekNumber] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[SemesterName] [char](4) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmissionWorkflowSteps](
	[Id] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TutorialCount] [int] NOT NULL,
	[TutorialLocation] [varchar](50) NULL,
	[SurveyId] [int] NOT NULL,
	[SurveyName] [varchar](100) NULL,
	[SendDate] [datetime2](7) NULL,
	[RespondDate] [datetime2](7) NULL,
	[TutorialId] [int] NOT NULL,
	[Notes] [varchar](8000) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutorials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Modality] [char](6) NOT NULL,
	[SemesterName] [char](4) NOT NULL,
	[ClassYearCode] [char](2) NULL,
	[ClientUserId] [int] NOT NULL,
	[CourseNumber] [varchar](50) NULL,
	[CourseDepartment] [varchar](50) NULL,
	[InstructorName] [varchar](150) NULL,
	[InstructorEmail] [varchar](150) NULL,
    [ShouldNotifyInstructor] [bit] NOT NULL,
	[InstructorNotifiedDate] [datetime2](7) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[TutorUserId] [int] NULL,
	[InstructorBannerId] [char](9) NULL,
	[LegacyTutorialSerial] int NULL
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE dbo.Tutorials
ADD CONSTRAINT
	FK_Tutorials_Semesters FOREIGN KEY
	(SemesterName) REFERENCES dbo.Semesters
	(SemesterName) 
	ON UPDATE  NO ACTION 
	ON DELETE  NO ACTION 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TutorTimeNotificationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[Description] [varchar](200) NULL,
	[EmailTemplate] [varchar](8000) NOT NULL,
	[EmailSubject] [varchar](8000) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[UsersRoles]    Script Date: 11/4/2019 5:06:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UsersRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [Pk_UsersRoles_Id] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UWCUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[eRaiderUsername] [varchar](50) NULL,
	[BannerId] [varchar](9) NULL,
	[FirstName] [varchar](40) NULL,
	[LastName] [varchar](40) NULL,
	[Email] [varchar](50) NULL,
	[RegisteredWithUWCDate] [datetime2](7) NULL,
	[IsEnglishFirstLanguage] [bit] NOT NULL,
	[FirstLanguageNonEnglish] [varchar](50) NULL,
	[College] [varchar](50) NULL,
	[Major] [varchar](100) NULL,
	[eraiderId] [varchar](10) NULL,
	[AlternateCredentialTypeId] [int] NULL,
	[AlternateCredentialKey] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WritingElements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[HtmlContent] [varchar](max) NOT NULL,
	[LastChangeDate] [datetime2](7) NOT NULL,
	[Keyword] [varchar](30) NOT NULL,
	[Weight] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OnlineTutorials]  WITH CHECK ADD  CONSTRAINT [fk_onlinetutorials_tutorials] FOREIGN KEY([TutorialId])
REFERENCES [dbo].[Tutorials] ([Id])
GO
ALTER TABLE [dbo].[OnlineTutorials] CHECK CONSTRAINT [fk_onlinetutorials_tutorials]
GO
ALTER TABLE [dbo].[OnlineTutorials]  WITH CHECK ADD  CONSTRAINT [fk_onlinetutorials_uwcusers] FOREIGN KEY([PreferredTutorUserId])
REFERENCES [dbo].[UWCUsers] ([Id])
GO
ALTER TABLE [dbo].[OnlineTutorials] CHECK CONSTRAINT [fk_onlinetutorials_uwcusers]
GO
ALTER TABLE [dbo].[OnsiteTutorials]  WITH CHECK ADD  CONSTRAINT [fk_onsitetutorials_tutorials] FOREIGN KEY([TutorialId])
REFERENCES [dbo].[Tutorials] ([Id])
GO
ALTER TABLE [dbo].[OnsiteTutorials] CHECK CONSTRAINT [fk_onsitetutorials_tutorials]
GO
CREATE UNIQUE NONCLUSTERED INDEX IX_Roles_RoleName ON dbo.Roles
(RoleName) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX IX_Semesters_SemesterName ON dbo.Semesters
	(
	SemesterName
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Semesters SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.SemesterWeeks ADD CONSTRAINT
	FK_SemesterWeeks_Semesters FOREIGN KEY (SemesterName) 
	REFERENCES dbo.Semesters(SemesterName) 
	ON UPDATE  NO ACTION 	 
	ON DELETE  NO ACTION 
GO	
ALTER TABLE [dbo].[Tutorials]  WITH CHECK ADD  CONSTRAINT [fk_tutorials_tutor_uwcusers] FOREIGN KEY([TutorUserId])
REFERENCES [dbo].[UWCUsers] ([Id])
GO
ALTER TABLE [dbo].[Tutorials] CHECK CONSTRAINT [fk_tutorials_tutor_uwcusers]
GO
ALTER TABLE [dbo].[Tutorials]  WITH CHECK ADD  CONSTRAINT [fk_tutorials_uwcusers] FOREIGN KEY([ClientUserId])
REFERENCES [dbo].[UWCUsers] ([Id])
GO
ALTER TABLE [dbo].[Tutorials] CHECK CONSTRAINT [fk_tutorials_uwcusers]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [fk_UsersRoles_Roles_1] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [fk_UsersRoles_Roles_1]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [fk_usersroles_uwcusers] FOREIGN KEY([UserId])
REFERENCES [dbo].[UWCUsers] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [fk_usersroles_uwcusers]
GO
ALTER TABLE [dbo].[Tutorials]  WITH CHECK ADD  CONSTRAINT [Chk_Modality] CHECK  (([modality]='ONSITE' OR [modality]='ONLINE'))
GO
ALTER TABLE [dbo].[Tutorials] CHECK CONSTRAINT [Chk_Modality]
GO
