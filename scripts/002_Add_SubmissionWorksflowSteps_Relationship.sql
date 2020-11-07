INSERT INTO dbo.SubmissionWorkflowSteps	( Id, Name, Description) 
VALUES 
(1,'Submitted','Submitted by client'),
(2,'Assigned','Assigned (or reassigned) to tutor'),
(3,'Rejected','Rejected by administrator'),
(4,'Incorrect','Submission is incorrect or missing information.'),
(5,'Tutoring','Tutor has started work'),
(6,'Tutored','Tutor has completed (submitted)'),
(7,'Read','Client has opened tutorial')

ALTER TABLE dbo.OnlineTutorials 
ADD CONSTRAINT fk_onlinetutorials_submissionworkflowsteps
FOREIGN KEY ( SubmissionWorkflowStepId ) 
REFERENCES dbo.SubmissionWorkflowSteps( Id ) 
ON DELETE NO ACTION ON UPDATE NO ACTION

