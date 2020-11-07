
CREATE UNIQUE NONCLUSTERED INDEX IX_UWCUsers_eRaiderId 
    ON dbo.UWCUsers (eraiderId) 
    WHERE eRaiderId IS NOT NULL;
GO
