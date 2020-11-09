using System;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;
using DbUp;
using DbUp.Builder;
using DbUp.Engine;
using DbUp.Helpers;
using DbUp.ScriptProviders;
using DbUp.Support;



class Program
{
    /// <param name="serverInstance">The SQL Server/Instance.</param>
    /// <param name="database">Name of database to create or migrate</param>
    /// <param name="user">Username for non-integrated auth, must also supply password</param>
    /// <param name="password">Password for non-integrated auth</param>
    /// <param name="scriptsPath">Server path to sql scripts directory.</param>

    public static int Main (
        string serverInstance,
        string database,
        string user = "",
        string password = "",
        string scriptsPath
      )
    { 
        //var connectionString = args[0];
        //var serverInstance = args[0];
        //var database = args[1];
        //string user = args[2];
        //string password = args[3];
        //var scriptsPath = args[4];

        //build and set SqlConnection String variable
        if (string.IsNullOrWhiteSpace(database) || string.IsNullOrWhiteSpace(serverInstance))
        {
            throw new ArgumentException("Must supply database and serverInstance");
        }

        var instanceName = serverInstance;

        var builder = new SqlConnectionStringBuilder();
        builder.DataSource = instanceName;
        builder.InitialCatalog = database;
        builder.Pooling = false;

        if (!string.IsNullOrWhiteSpace(user) && !string.IsNullOrWhiteSpace(password))
        {
            builder.UserID = user;
            builder.Password = password;
        }
        else
        {
            builder.IntegratedSecurity = true;
        }
        var connectionString = builder.ToString();

        Console.WriteLine("Start executing predeployment scripts...");
        string preDeploymentScriptsPath = Path.Combine(scriptsPath, "PreDeployment");
        var preDeploymentScriptsExecutor =
            DeployChanges.To
                .SqlDatabase(connectionString)
                .WithScriptsFromFileSystem(preDeploymentScriptsPath, new FileSystemScriptOptions
                {
                    IncludeSubDirectories = true
                })
                .LogToConsole()
                .JournalTo(new NullJournal())
                .Build();

        var preDeploymentUpgradeResult = preDeploymentScriptsExecutor.PerformUpgrade();

        if (!preDeploymentUpgradeResult.Successful)
        {
            return ReturnError(preDeploymentUpgradeResult.Error.ToString());
        }

        ShowSuccess();

        Console.WriteLine("Start executing migration scripts...");
        var migrationScriptsPath = Path.Combine(scriptsPath, "Migrations");
        var upgrader =
            DeployChanges.To
                .SqlDatabase(connectionString)
                .WithScriptsFromFileSystem(migrationScriptsPath, new FileSystemScriptOptions
                {
                    IncludeSubDirectories = true
                })
                .LogToConsole()
                .JournalToSqlTable("dbup", "Migrations")
                .Build();

        var result = upgrader.PerformUpgrade();

        if (!result.Successful)
        {
            return ReturnError(result.Error.ToString());
        }

        ShowSuccess();

        Console.WriteLine("Start executing postdeployment scripts...");
        string postdeploymentScriptsPath = Path.Combine(scriptsPath, "PostDeployment");
        var postDeploymentScriptsExecutor =
            DeployChanges.To
                .SqlDatabase(connectionString)
                .WithScriptsFromFileSystem(postdeploymentScriptsPath, new FileSystemScriptOptions
                {
                    IncludeSubDirectories = true
                })
                .LogToConsole()
                .JournalTo(new NullJournal())
                .Build();

        var postdeploymentUpgradeResult = postDeploymentScriptsExecutor.PerformUpgrade();

        if (!postdeploymentUpgradeResult.Successful)
        {
            return ReturnError(result.Error.ToString());
        }

        ShowSuccess();

        return 0;
    }

    private static void ShowSuccess()
    {
        Console.ForegroundColor = ConsoleColor.Green;
        Console.WriteLine("Success!");
        Console.ResetColor();
    }

    private static int ReturnError(string error)
    {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine(error);
        Console.ResetColor();
        return -1;
    }
}