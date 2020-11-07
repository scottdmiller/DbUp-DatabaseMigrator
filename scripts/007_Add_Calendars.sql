Create Procedure Calendar_InsertCalendarYear
@calendarYear char(4)
as
DECLARE @maxDate DATETIME
SELECT @maxDate = max(CalendarDate)
FROM calendars
IF @maxDate < @calendarYear + '-12-31'
	OR @maxdate IS NULL
BEGIN
	DECLARE @CalendarDate SMALLDATETIME
	SET @CalendarDate = @calendarYear + '-01-01'
	WHILE @CalendarDate <= @calendarYear + '-12-31'
	BEGIN
		INSERT dbo.Calendars (CalendarDate)
		SELECT @CalendarDate
		SET @CalendarDate = @CalendarDate + 1
	END
END
UPDATE dbo.Calendars
SET isWeekday = CASE 
		WHEN DATEPART(DW, CalendarDate) IN (1,7)
			THEN 0
		ELSE 1
		END
	,isHoliday       = 0
	,calendarYear    = YEAR(CalendarDate)
	,FiscalYear      = YEAR(CalendarDate)
	,Quarter         = CASE
		WHEN MONTH(CalendarDate) <= 3
			THEN 1
		WHEN MONTH(CalendarDate) <= 6
			THEN 2
		WHEN MONTH(CalendarDate) <= 9
			THEN 3
		ELSE 4
		END
	,CalendarMonth   = MONTH(CalendarDate)
	,CalendarDay     = DAY(CalendarDate)
	,DayOfWeekNumber = DATEPART(DW, CalendarDate)
	,MonthName       = DATENAME(MONTH, CalendarDate)
	,DayName         = DATENAME(DW, CalendarDate)
	,CalendarWeek    = DATEPART(WK, CalendarDate)
Go
Exec Calendar_InsertCalendarYear @calendarYear='2019'
Exec Calendar_InsertCalendarYear @calendarYear='2020'
