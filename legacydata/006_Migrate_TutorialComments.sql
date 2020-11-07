SET IDENTITY_INSERT dbo.[AdminEvaluationOfTutorCritiques] ON

INSERT INTO [dbo].[AdminEvaluationOfTutorCritiques]
    (Id
    ,OnlineTutorialId
    ,EvaluativeText
    ,ThisCommenterUserId
    ,EvaluationDate
    )
SELECT comment_id AS id 
    ,tutorial_id AS onlineTutorialId 
    ,response AS EvaluativeText 
    ,super_id AS ThisCommenterUserId 
    ,comment_date AS EvaluationDate
FROM uwc.dbo.tutorial_comments

SET IDENTITY_INSERT dbo.[AdminEvaluationOfTutorCritiques] OFF