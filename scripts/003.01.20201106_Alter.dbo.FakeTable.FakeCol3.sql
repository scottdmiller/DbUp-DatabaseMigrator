IF OBJECT_ID('dbo.FakeTable') IS NULL
BEGIN
    SELECT 'Table does not exist.';
END
ELSE
    BEGIN
        ALTER TABLE dbo.FakeTable
        ALTER COLUMN FakeCol3 DECIMAL(20,2) NULL;
        
    END
GO