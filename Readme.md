Documentation for DbUp-DatabaseMigrator

Main documentation:
https://dbup.readthedocs.io

Reference material (almost built verbatium)
http://www.kamilgrzybek.com/database/using-database-project-and-dbup-for-database-management/

Acknowledgements:
Rob Hudson (ask if email is OK) was consultant for a project in my department 
that I've kept in touch  and he provided an intial setup for a process he created. Of which,
I stole the param setup and some of the flags for data checks from. Thanks to him!

>> dotnet .\bin\Debug\netcoreapp2.1\DatabaseMigration.dll -h
Usage:
  DatabaseMigration [options]

Options:
  --server-instance <server-instance>    serverInstance		"AUDIOSLAVE\DEV"
  --database <database>                  database			"TestDB"
  --scripts-path <scripts-path>          scriptsPath		" " (left as a space but required for flexibility of using a different directory)
  --user <user>                          user				I wanted to leave user & password as an option in case we needed them but (cont.)
  --password <password>                  password			security uses Windows (trusted)
  --version                              Version Info		DbUp module version information

Execution
dotnet .\DatabseMigration.dll 
--server-instance "AUDIOSLAVE\DEV"
--database "TestDB"
--scripts-path " " 
--user "" (optional)
--password "" (optional)

Dependecies:
- .net core v2.1
- dbup (v4.2)
- dbup-sqlserver (v4.2)

Sql Objects/Dependencies:
Dependencies
- As of V1, there are no checks for if server, database, schemas exists (probably in future versions)
- [dbup] schema needs to exists on target database (--server-instance + --database) (I can/will check and create if not exists)
Objects
- dbup.Migrations -- It is for the "Journal" functionality and is automatically build (if all depenent objects exits).
-- This table is what is used to compare against the \Mirgations folders script name to see if that script has already
-- been executed before. If a record matching that .sql file name DOES NOT exists in dbup.Migrations, it will run.
-- If that exists, it will be skipped.

