delete from [OnlineTutorials]
delete from [Tutorials]

DECLARE @unassigned INT = (select id from SubmissionWorkflowSteps where Name = 'Submitted')
DECLARE @assigned INT = (select id from SubmissionWorkflowSteps where Name = 'Assigned')
DECLARE @tutored INT = (select id from SubmissionWorkflowSteps where Name = 'Tutored')

DECLARE @tutorId INT = (select top 1 u.id from UWCUsers u join UsersRoles ur on ur.UserId = u.Id join Roles r on ur.RoleId = r.id and r.RoleName = 'Online Tutor' )

DBCC CHECKIDENT ('[Tutorials]', RESEED, 1)
SET IDENTITY_INSERT [Tutorials] ON
INSERT INTO [dbo].[Tutorials] ([Id],[Modality] ,[SemesterName] ,[ClassYearCode] ,[ClientUserId] ,[CourseNumber] ,[CourseDepartment] ,[InstructorName] ,[InstructorEmail] ,[CreatedBy] ,[CreatedAt] ,[UpdatedBy] ,[UpdatedAt] ,[TutorUserId] ,[InstructorBannerId], [ShouldNotifyInstructor])
VALUES
(1, 'Online','SP20','FR',6 ,'CourseNumber' ,'CourseDepartment','InstructorName','InstructorEmail',1,CURRENT_TIMESTAMP,NULL,NULL ,@tutorId,'InsBanId',0),
(2, 'Online','SP20','FR',6 ,'CourseNumber' ,'CourseDepartment','InstructorName','InstructorEmail',1,CURRENT_TIMESTAMP,NULL,NULL ,@tutorId ,'InsBanId',1),
(3, 'Online','SP20','SO',6 ,'CourseNumber' ,'CourseDepartment','InstructorName','InstructorEmail',1,CURRENT_TIMESTAMP,NULL,NULL ,NULL ,'InsBanId',0),
(4, 'Online','SP20','JR',6 ,'CourseNumber' ,'CourseDepartment','InstructorName','InstructorEmail',1,CURRENT_TIMESTAMP,NULL,NULL ,@tutorId,'InsBanId',1),
(5, 'Online','SP20','JR',6 ,'CourseNumber' ,'CourseDepartment','InstructorName','InstructorEmail',1,CURRENT_TIMESTAMP,NULL,NULL ,@tutorId,'InsBanId',1),

(6, 'Online','SP20','SO',6 ,'CourseNumber' ,'CourseDepartment','InstructorName','InstructorEmail',1,CURRENT_TIMESTAMP,NULL,NULL ,6,'InsBanId',0),
(7, 'Online','SP20','JR',6 ,'CourseNumber' ,'CourseDepartment','InstructorName','InstructorEmail',1,CURRENT_TIMESTAMP,NULL,NULL ,6,'InsBanId',1),
(8, 'Online','SP20','JR',6 ,'CourseNumber' ,'CourseDepartment','InstructorName','InstructorEmail',1,CURRENT_TIMESTAMP,NULL,NULL ,6,'InsBanId',1)

SET IDENTITY_INSERT [Tutorials] OFF


DBCC CHECKIDENT ('[OnlineTutorials]', RESEED, 1)
SET IDENTITY_INSERT [OnlineTutorials] ON

INSERT INTO [dbo].[OnlineTutorials] (
	[Id]
	,[IsCourseWritingIntensive]
    ,[IsFirstOnlineSubmission]
    ,[DraftTitle]
    ,[DraftDescription]
    ,[DraftText]
    ,[TextFromClientDraftFile]
    ,[ClientDraftFilename]
    ,[ClientDraftFileSize]
    ,[ClientDraftFileExtension]
    ,[UWCSystemFilename]
    ,[SubmissionWorkflowStepId]
    ,[DraftSubmitDate]
    ,[ClientAssignmentDueDate]
    ,[AssignedToTutorDate]
    ,[DueFromTutorDate]
    ,[HoursRemainingNotifyTutorDate]
    ,[HoursRemainingTutorNotifiedDate]
    ,[OverdueFromTutorDate]
    ,[CompletedByTutorDueDate]
    ,[CritiquedByTutorDate]
    ,[ClientReadCritiqueDate]
    ,[TutorCritique]
    ,[TutorEstimatedTimeToComplete]
    ,[TutorActualTimeToComplete]
    ,[ClientRequestedTutorTime]
    ,[ClientTimeSpentWriting]
    ,[CreatedBy]
    ,[CreatedAt]
    ,[UpdatedBy]
    ,[UpdatedAt]
    ,[DraftTutorFocus]
    ,[PreferredTutorUserId]
    ,[TutorialId])
VALUES
(1, 1, 1,'Jabberwocky' ,NULL,'’Twas brillig, and the slithy toves
Did gyre and gimble in the wabe;
All mimsy were the borogoves,
And the mome raths outgrabe.

“Beware the Jabberwock, my son!
The jaws that bite, the claws that catch!
Beware the Jubjub bird, and shun
The frumious Bandersnatch!”

He took his vorpal sword in hand:
Long time the manxome foe he sought—
So rested he by the Tumtum tree,
And stood awhile in thought.',NULL,'',NULL ,NULL,'LC.docx',@assigned, CURRENT_TIMESTAMP, '2020-1-1' ,'2020-2-2' ,NULL ,NULL ,NULL,NULL,NULL ,NULL,NULL ,'',NULL,NULL,30, '30', 1,CURRENT_TIMESTAMP,NULL ,NULL, '' , NULL ,1),
(2, 1, 1,'The Raven' ,NULL,'Once upon a midnight dreary, while I pondered, weak and weary,
Over many a quaint and curious volume of forgotten lore—
    While I nodded, nearly napping, suddenly there came a tapping,
As of some one gently rapping, rapping at my chamber door.
“’Tis some visitor,” I muttered, “tapping at my chamber door—
            Only this and nothing more.”',NULL,'',NULL ,NULL,'',@assigned, DATEADD(day, 1, GETDATE()), '2020-1-1' ,'2020-2-2' ,NULL ,NULL ,NULL,NULL,NULL ,NULL,NULL ,'Insightful comments',33,22,60, '30', 1,CURRENT_TIMESTAMP ,NULL ,NULL, '' , NULL,2),
(3, 1, 1,'Annabel Lee' ,NULL,'It was many and many a year ago,
In a kingdom by the sea,
   That a maiden there lived whom you may know
By the name of Annabel Lee;
   And this maiden she lived with no other thought
Than to love and be loved by me.',NULL,'12b.docx',NULL ,NULL,'12b.docx',@unassigned, DATEADD(day, 3, GETDATE()), '2020-1-1' ,'2020-2-2' ,NULL ,NULL ,NULL,NULL,NULL ,NULL,NULL ,'',NULL,NULL,30, '30', 1,CURRENT_TIMESTAMP,NULL ,NULL, '' , 3,3),
(4, 1, 1,'Antigonish' ,NULL,'Yesterday, upon the stair,
I met a man who wasn''t there!
He wasn''t there again today,
Oh how I wish he''d go away!',NULL,'',NULL ,NULL,'',@tutored, DATEADD(day, 30, GETDATE()), '2020-1-1' ,'2020-2-2' ,NULL ,NULL ,NULL,NULL,NULL ,NULL,NULL ,'',NULL,NULL,60, '30', 1,CURRENT_TIMESTAMP,NULL ,NULL, '' , NULL ,4),
 (5 -- id
,1 -- <IsCourseWritingIntensive, bit,>
,1 -- <IsFirstOnlineSubmission, bit,>
,'Title' -- <DraftTitle, varchar(500),>
, 'DraftDescription'
, 'DraftText'
, NULL -- <TextFromClientDraftFile, varchar(max),>
, NULL -- <ClientDraftFilename, varchar(8000),>
, NULL -- <ClientDraftFileSize, int,>
, NULL -- <ClientDraftFileExtension, varchar(5),>
, NULL -- <UWCSystemFilename, varchar(8000),>
, @tutored -- <SubmissionWorkflowStepId, int,>
, NULL -- <DraftSubmitDate, datetime2(7),>
, CURRENT_TIMESTAMP -- <ClientAssignmentDueDate, datetime2(7),>
, NULL -- <AssignedToTutorDate, datetime2(7),>
, NULL -- <DueFromTutorDate, datetime2(7),>
, NULL -- <HoursRemainingNotifyTutorDate, datetime2(7),>
, NULL -- <HoursRemainingTutorNotifiedDate, datetime2(7),>
, NULL -- <OverdueFromTutorDate, datetime2(7),>
, NULL -- <CompletedByTutorDueDate, datetime2(7),>
, CURRENT_TIMESTAMP -- <CritiquedByTutorDate, datetime2(7),>
, NULL -- <ClientReadCritiqueDate, datetime2(7),>
, NULL -- <TutorCritique, varchar(max),>
, NULL -- <TutorEstimatedTimeToComplete, int,>
, NULL -- <TutorActualTimeToComplete, int,>
, NULL -- <ClientRequestedTutorTime, int,>
, '30' -- <ClientTimeSpentWriting, varchar(50),>
, 1 -- <CreatedBy, int,>
, CURRENT_TIMESTAMP -- <CreatedAt, datetime2(7),>
, NULL -- <UpdatedBy, int,>
, NULL -- <UpdatedAt, datetime2(7),>
, 'watch this' -- <DraftTutorFocus, varchar(max),>
, NULL -- <PreferredTutorUserId, int,>
, 5 -- <TutorialId, int,>)
),
(6 -- id
,1 -- <IsCourseWritingIntensive, bit,>
,1 -- <IsFirstOnlineSubmission, bit,>
,'Title' -- <DraftTitle, varchar(500),>
, 'DraftDescription'
, 'DraftText'
, NULL -- <TextFromClientDraftFile, varchar(max),>
, NULL -- <ClientDraftFilename, varchar(8000),>
, NULL -- <ClientDraftFileSize, int,>
, NULL -- <ClientDraftFileExtension, varchar(5),>
, NULL -- <UWCSystemFilename, varchar(8000),>
, @tutored -- <SubmissionWorkflowStepId, int,>
, DATEADD(day, -10, GETDATE()) -- <DraftSubmitDate, datetime2(7),>
, CURRENT_TIMESTAMP -- <ClientAssignmentDueDate, datetime2(7),>
, DATEADD(day, -9, GETDATE()) -- <AssignedToTutorDate, datetime2(7),>
, DATEADD(day, -1, GETDATE())  -- <DueFromTutorDate, datetime2(7),>
, NULL -- <HoursRemainingNotifyTutorDate, datetime2(7),>
, NULL -- <HoursRemainingTutorNotifiedDate, datetime2(7),>
, NULL -- <OverdueFromTutorDate, datetime2(7),>
, DATEADD(day, -3, GETDATE())  -- <CompletedByTutorDueDate, datetime2(7),>
, DATEADD(day, -7, GETDATE()) -- <CritiquedByTutorDate, datetime2(7),>
, NULL -- <ClientReadCritiqueDate, datetime2(7),>
, 'A joy to read! A really really long comment... More comments... super long comment' -- <TutorCritique, varchar(max),>
, NULL -- <TutorEstimatedTimeToComplete, int,>
, NULL -- <TutorActualTimeToComplete, int,>
, NULL -- <ClientRequestedTutorTime, int,>
, '30' -- <ClientTimeSpentWriting, varchar(50),>
, 1 -- <CreatedBy, int,>
, CURRENT_TIMESTAMP -- <CreatedAt, datetime2(7),>
, NULL -- <UpdatedBy, int,>
, NULL -- <UpdatedAt, datetime2(7),>
, 'watch this' -- <DraftTutorFocus, varchar(max),>
, NULL -- <PreferredTutorUserId, int,>
, 6 -- <TutorialId, int,>)
),
(7 -- id
,1 -- <IsCourseWritingIntensive, bit,>
,1 -- <IsFirstOnlineSubmission, bit,>
,'Title' -- <DraftTitle, varchar(500),>
, 'DraftDescription'
, 'DraftText'
, NULL -- <TextFromClientDraftFile, varchar(max),>
, NULL -- <ClientDraftFilename, varchar(8000),>
, NULL -- <ClientDraftFileSize, int,>
, NULL -- <ClientDraftFileExtension, varchar(5),>
, NULL -- <UWCSystemFilename, varchar(8000),>
, @assigned -- <SubmissionWorkflowStepId, int,>
, NULL -- <DraftSubmitDate, datetime2(7),>
, CURRENT_TIMESTAMP -- <ClientAssignmentDueDate, datetime2(7),>
, CURRENT_TIMESTAMP -- <AssignedToTutorDate, datetime2(7),>
, NULL -- <DueFromTutorDate, datetime2(7),>
, NULL -- <HoursRemainingNotifyTutorDate, datetime2(7),>
, NULL -- <HoursRemainingTutorNotifiedDate, datetime2(7),>
, NULL -- <OverdueFromTutorDate, datetime2(7),>
, DATEADD(day, 4, GETDATE()) -- <CompletedByTutorDueDate, datetime2(7),>
, CURRENT_TIMESTAMP -- <CritiquedByTutorDate, datetime2(7),>
, NULL -- <ClientReadCritiqueDate, datetime2(7),>
, NULL -- <TutorCritique, varchar(max),>
, NULL -- <TutorEstimatedTimeToComplete, int,>
, NULL -- <TutorActualTimeToComplete, int,>
, NULL -- <ClientRequestedTutorTime, int,>
, '30' -- <ClientTimeSpentWriting, varchar(50),>
, 1 -- <CreatedBy, int,>
, CURRENT_TIMESTAMP -- <CreatedAt, datetime2(7),>
, NULL -- <UpdatedBy, int,>
, NULL -- <UpdatedAt, datetime2(7),>
, 'watch this' -- <DraftTutorFocus, varchar(max),>
, NULL -- <PreferredTutorUserId, int,>
, 7 -- <TutorialId, int,>)
)
SET IDENTITY_INSERT [OnlineTutorials] OFF
