IF OBJECT_ID('dbo.FakeTable') IS NULL
BEGIN
    SELECT 'Table does not exist.';
END
ELSE
    BEGIN
        ALTER TABLE dbo.FakeTable
        ADD FakeCol3 DECIMAL(38,2) NULL;
        
        ALTER TABLE dbo.FakeTable
        ADD CONSTRAINT DF_FakeCol3 DEFAULT ('0.00') FOR FakeCol3;
    END
GO