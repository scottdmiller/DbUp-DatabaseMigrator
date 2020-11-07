USE writingcenter
GO

DELETE onsitetutorials
DELETE onlinetutorials
DELETE tutorials

UPDATE uwc..userclassstatus SET class_year=
	CASE  classStatus
		WHEN 'Freshman' THEN 'FR'
		WHEN 'Sophomore' THEN 'SO'
		WHEN 'Junior' THEN 'JR'
		WHEN 'Senior' THEN 'SR'
		WHEN 'Graduate' THEN 'GR'
		WHEN 'Non-Degreed' THEN 'NG'
		WHEN 'Faculty' THEN 'FA'
	END

/*
+---------------------------------------------
|       ## Tutorials -> Online
+---------------------------------------------
*/

PRINT 'Inserting Tutorials Online'

INSERT INTO Tutorials
(
	Modality
	,SemesterName
	,ClassYearCode
	,ClientUserId
	,CourseNumber
	,CourseDepartment
	,InstructorName
	,InstructorEmail
	,ShouldNotifyInstructor
	,InstructorNotifiedDate
	,TutorUserId
	,CreatedBy
	,CreatedAt
	,LegacyTutorialSerial
)SELECT
	'Online'
	,Semester
	,case when upper(class_year) in (select code from classyears union select null) then class_year else null end
	,user_ID
	,convert(varchar,course_number)
	,convert(varchar,course_dept)
	,instructor
	,instructor_email
	,case inform_ins when 'y' then 1 else 0 end
	,notified_instructor_date
	,tutor_user_id
	,1
	,CreatedDate
	,serial
FROM 
	uwc..SubmittedDrafts s inner join uwcusers u on s.user_id=u.id
WHERE
	SEMESTER IN ('FA17','SP18','SU18','FA18','SP19','SU19','FA19','SP20')



/*
+---------------------------------------------
|       ## Tutorials -> Onsite
+---------------------------------------------
*/
PRINT 'Inserting Tutorials Onsite'
INSERT INTO tutorials
	(
	ShouldNotifyInstructor
	,CourseNumber
	,InstructorName
	,InstructorEmail
	,Modality
	,SemesterName
	,TutorUserId
	,ClientUserId
	,LegacyTutorialSerial
	,CreatedBy
	,CreatedAt
	)
SELECT
	CASE inform_instructor WHEN 'y' THEN 1 ELSE 0 END
	,course
	,instructor
	,instructor_email
	,'Onsite'
	,semester
	,tutor_user_id
	,users_user_id
	,serial
	,1
	,CURRENT_TIMESTAMP

FROM uwc..onsite_tutorials
WHERE
 SEMESTER IN ('FA17','SP18','SU18','FA18','SP19','SU19','FA19','SP20')


PRINT 'Updating Class Year'

UPDATE tutorials SET classyearcode=class_year
FROM
	uwc..userClassStatus uc
	INNER JOIN tutorials t
	ON t.clientuserid=uc.userid
WHERE t.classyearcode IS NULL


SET IDENTITY_INSERT onsiteTutorials ON


PRINT 'Inserting OnsiteTutorials'

/*
+---------------------------------------------
|       ## Onsite Tutorials
+---------------------------------------------
*/

INSERT INTO OnsiteTutorials
	(
	Id
	,IsCourseWritingIntensive
	,TutorialDate
	,TutorialTime
	,HadAppointment
	,TutorComments
	,GraduateOrUndergraduate
	,CreatedBy
	,CreatedAt
	,tutorialId
	)
SELECT
	serial
	,CASE wi WHEN 'Y' THEN 1 ELSE 0 END
	,tutorial_date
	,tutorial_time
	,CASE appt WHEN 'y' THEN 1 ELSE 0 END
	,comments
	,writing_center_type
	,0
	,CURRENT_TIMESTAMP
	,t.id
FROM uwc..onsite_tutorials o INNER JOIN tutorials t ON o.serial=t.LegacyTutorialSerial AND t.modality='Onsite'
WHERE SEMESTER IN ('FA17','SP18','SU18','FA18','SP19','SU19','FA19','SP20')

SET IDENTITY_INSERT onsiteTutorials OFF


PRINT 'Inserting Online Tutorials'

SET IDENTITY_INSERT OnlineTutorials ON

INSERT INTO OnlineTutorials
	(
	Id
	,DraftTitle
	,DraftDescription
	,DraftText
	,DraftTutorFocus
	,ClientDraftFilename
	,ClientDraftFileSize
	,ClientDraftFileExtension
	,UWCSystemFilename
	,SubmissionWorkflowStepId
	,DraftSubmitDate
	,ClientAssignmentDueDate
	,AssignedToTutorDate
	,DueFromTutorDate
	,CritiquedByTutorDate
	,TutorCritique
	,TutorEstimatedTimeToComplete
	,TutorActualTimeToComplete
	,ClientRequestedTutorTime
	,ClientTimeSpentWriting
	,PreferredTutorUserId
	,TutorialId
	,createdBy
	,CreatedAt
	)
SELECT
	serial
	,draft_title
	,draft_desc
	,draft_text
	,draft_problem
	,filename
	,filesize
	,fileextension
	,newfilename
	,disposition
	,draft_subdate
	,draft_due_date
	,assign_date
	,tutor_dueDate
	,return_date
	,critique
	,timeblock_estimate
	,timeblock_actual
	,client_timeblock_estimated
	,timespent
	,Preferred_Tutor
	,t.id
	,0
	,CURRENT_TIMESTAMP
FROM uwc..SubmittedDrafts o INNER JOIN tutorials t ON o.serial=t.LegacyTutorialSerial AND t.modality='Online'
WHERE SEMESTER IN ('FA17','SP18','SU18','FA18','SP19','SU19','FA19','SP20')

SET IDENTITY_INSERT onlineTutorials OFF
