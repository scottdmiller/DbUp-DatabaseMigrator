SET IDENTITY_INSERT SemesterWeeks ON

INSERT INTO SemesterWeeks
    (
    Id
    ,WeekNumber
    ,StartDate
    ,EndDate
    ,SemesterName
    )
SELECT id ,weekNumber ,startDate ,endDate ,semester
FROM uwc.dbo.semesterweeks
WHERE semester IN ('FA17','SP18','SU18','FA18','SP19','SU19','FA19','SP20')

SET IDENTITY_INSERT SemesterWeeks OFF
