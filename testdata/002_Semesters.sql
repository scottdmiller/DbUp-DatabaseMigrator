INSERT INTO Semesters(SemesterName, StartDate, EndDate, AcademicTermCode, IsCurrentSemester)
VALUES('FA99','2099-08-01','2099-12-31', '209927',1)
UPDATE Semesters Set IsCurrentSemester = 0 WHERE SemesterName <> 'FA99'
UPDATE Semesters Set IsCurrentSemester = 1 WHERE SemesterName = 'FA99'