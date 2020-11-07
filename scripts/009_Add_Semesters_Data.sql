SET IDENTITY_INSERT [dbo].[Semesters] ON 
GO
INSERT [dbo].[Semesters]
    ([Id], [SemesterName], [StartDate], [EndDate], [AcademicTermCode], [IsCurrentSemester])
VALUES
    (1 ,N'FA17' ,CAST(N'2017-08-27T00:00:00.0000000' AS DATETIME2) ,CAST(N'2017-12-22T00:00:00.0000000' AS DATETIME2) ,N'201827' ,0)
    ,(2 ,N'SP18' ,CAST(N'2018-01-15T00:00:00.0000000' AS DATETIME2) ,CAST(N'2018-06-01T00:00:00.0000000' AS DATETIME2) ,N'201857' ,0)
    ,(3 ,N'SU18' ,CAST(N'2018-06-01T00:00:00.0000000' AS DATETIME2) ,CAST(N'2018-08-24T00:00:00.0000000' AS DATETIME2) ,N'201877' ,0)
    ,(4 ,N'FA18' ,CAST(N'2018-08-20T00:00:00.0000000' AS DATETIME2) ,CAST(N'2018-12-23T00:00:00.0000000' AS DATETIME2) ,N'201927' ,0)
    ,(5 ,N'SP19' ,CAST(N'2019-01-01T00:00:00.0000000' AS DATETIME2) ,CAST(N'2019-06-01T00:00:00.0000000' AS DATETIME2) ,N'201957' ,0)
    ,(6 ,N'SU19' ,CAST(N'2019-06-10T00:00:00.0000000' AS DATETIME2) ,CAST(N'2019-08-24T00:00:00.0000000' AS DATETIME2) ,N'201977' ,0)
    ,(7 ,N'FA19' ,CAST(N'2019-08-25T00:00:00.0000000' AS DATETIME2) ,CAST(N'2019-12-05T00:00:00.0000000' AS DATETIME2) ,N'202027' ,0)
    ,(8 ,N'SP20' ,CAST(N'2020-01-12T00:00:00.0000000' AS DATETIME2) ,CAST(N'2020-05-12T00:00:00.0000000' AS DATETIME2) ,N'202057' ,1)
GO
SET IDENTITY_INSERT [dbo].[Semesters] OFF
GO