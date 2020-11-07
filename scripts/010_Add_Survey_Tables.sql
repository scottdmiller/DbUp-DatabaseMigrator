CREATE TABLE [Surveys]
(
    [Id]         INT            NOT NULL IDENTITY
    ,[SurveyType] VARCHAR(15)    NOT NULL
    ,[Order]      INT            NOT NULL
    ,[Title]      VARCHAR(100)   NULL
	,[Html]       [VARCHAR](max) NULL
    ,CONSTRAINT [PK_Surveys] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Questions]
(
    [Id]       INT NOT NULL IDENTITY
    ,[Number]   INT NOT NULL
    ,[SurveyId] INT NOT NULL
    ,CONSTRAINT [PK_Questions] PRIMARY KEY ([Id])
    ,CONSTRAINT [FK_Questions_Surveys_SurveyId] FOREIGN KEY ([SurveyId]) REFERENCES [Surveys] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [SurveyResponses]
(
    [Id]           INT       NOT NULL IDENTITY
    ,[ClientUserId] INT       NOT NULL
    ,[SurveyId]     INT       NOT NULL
    ,[SentDate]     DATETIME2 NOT NULL
    ,[ResponseDate] DATETIME2 NULL
    ,[TutorialId]   INT       NOT NULL
    ,CONSTRAINT [PK_SurveyResponses] PRIMARY KEY ([Id])
    ,CONSTRAINT [FK_SurveyResponses_UwcUsers_ClientUserId] FOREIGN KEY ([ClientUserId]) REFERENCES [UwcUsers] ([Id]) ON DELETE CASCADE
    ,CONSTRAINT [FK_SurveyResponses_Surveys_SurveyId] FOREIGN KEY ([SurveyId]) REFERENCES [Surveys] ([Id]) ON DELETE CASCADE
    ,CONSTRAINT [FK_SurveyResponses_Tutorials_TutorialId] FOREIGN KEY ([TutorialId]) REFERENCES [Tutorials] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [QuestionParts]
(
    [Id]         INT          NOT NULL IDENTITY
    ,[Part]       INT          NOT NULL
    ,[Label]      VARCHAR(max) NULL
    ,[ShortLabel] VARCHAR(50)  NULL
    ,[InputType]  VARCHAR(15)  NOT NULL
    ,[QuestionId] INT          NOT NULL
    ,CONSTRAINT [PK_QuestionParts] PRIMARY KEY ([Id])
    ,CONSTRAINT [FK_QuestionParts_Questions_QuestionId] FOREIGN KEY ([QuestionId]) REFERENCES [Questions] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Answers]
(
    [Id]               INT          NOT NULL IDENTITY
    ,[Value]            VARCHAR(max) NULL
    ,[QuestionPartId]   INT          NOT NULL
    ,[SurveyResponseId] INT          NOT NULL
    ,CONSTRAINT [PK_Answers] PRIMARY KEY ([Id])
    ,CONSTRAINT [FK_Answers_QuestionParts_QuestionPartId] FOREIGN KEY ([QuestionPartId]) REFERENCES [QuestionParts] ([Id]) ON DELETE CASCADE
    ,CONSTRAINT [FK_Answers_SurveyResponses_SurveyResponseId] FOREIGN KEY ([SurveyResponseId]) REFERENCES [SurveyResponses] ([Id]) ON DELETE NO ACTION
);

GO

CREATE TABLE [QuestionOptions]
(
    [Id]             INT          NOT NULL IDENTITY
    ,[Order]          INT          NOT NULL
    ,[Label]          VARCHAR(500) NULL
    ,[Value]          VARCHAR(50)  NULL
    ,[QuestionPartId] INT          NULL
    ,CONSTRAINT [PK_QuestionOptions] PRIMARY KEY ([Id])
    ,CONSTRAINT [FK_QuestionOptions_QuestionParts_QuestionPartId] FOREIGN KEY ([QuestionPartId]) REFERENCES [QuestionParts] ([Id]) ON DELETE NO ACTION
);

GO

CREATE INDEX [IX_Answers_QuestionPartId] ON [Answers] ([QuestionPartId]);

GO

CREATE INDEX [IX_Answers_SurveyResponseId] ON [Answers] ([SurveyResponseId]);

GO

CREATE INDEX [IX_QuestionOptions_QuestionPartId] ON [QuestionOptions] ([QuestionPartId]);

GO

CREATE INDEX [IX_QuestionParts_QuestionId] ON [QuestionParts] ([QuestionId]);

GO

CREATE INDEX [IX_Questions_SurveyId] ON [Questions] ([SurveyId]);

GO

CREATE INDEX [IX_SurveyResponses_ClientUserId] ON [SurveyResponses] ([ClientUserId]);

GO

CREATE INDEX [IX_SurveyResponses_SurveyId] ON [SurveyResponses] ([SurveyId]);

GO

CREATE INDEX [IX_SurveyResponses_TutorialId] ON [SurveyResponses] ([TutorialId]);

GO