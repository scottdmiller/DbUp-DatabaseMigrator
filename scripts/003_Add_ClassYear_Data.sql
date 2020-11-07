INSERT INTO dbo.ClassYears(Code,Name,SortOrder)
VALUES
	('FR','Freshman',1),
	('SO','Sophomore',2),
	('JR','Junior',3),
	('SR','Senior',4),
	('GR','Graduate',5),
	('FA','Faculty',6),
	('NG','Non-Degreed',9);


ALTER TABLE dbo.Tutorials
ADD CONSTRAINT fk_tutorials_classyears
FOREIGN KEY ( ClassYearCode ) 
REFERENCES dbo.ClassYears( Code ) 
ON DELETE NO ACTION ON UPDATE NO ACTION

