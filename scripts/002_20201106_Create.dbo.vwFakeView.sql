IF OBJECT_ID('dbo.vwFakeView') IS NOT NULL
BEGIN
    DROP VIEW dbo.vwFakeView;
END
GO

CREATE VIEW dbo.vwFakeView
AS
SELECT FakeCol1 AS FakeColumnOne
        ,FakeCol2 AS FakeColumnTwo
FROM dbo.FakeTable;
GO