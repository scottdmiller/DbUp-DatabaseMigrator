using System;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;
using DbUp;
using DbUp.Builder;
using DbUp.Engine;
using DbUp.Helpers;
using DbUp.Support;

namespace Indy.DatabaseMigration
{
    /// <summary>
    /// Class for reusable DbUp database migration with embedded resource files
    /// </summary>
    public static class DatabaseMigration
    {
        private static bool MigrateDatabase(
            Action<UpgradeEngineBuilder> addScripts,
            string serverInstance,
            string database,
            bool ensureDatabase,
            bool drop,
            bool noConfirmDrop,
            bool withTransaction,
            bool withTransactionPerScript,
            bool generateReport,
            string user,
            string password
            )
        {
            var ret = true;

            if (string.IsNullOrWhiteSpace(database) || addScripts == null || string.IsNullOrWhiteSpace(serverInstance))
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

            if (drop)
            {
                if (!noConfirmDrop)
                {
                    Console.Write($"Are you sure you want to drop {database} on {serverInstance} (y/N)? ");
                    if (Console.ReadLine().Trim().ToLower() != "y")
                    {
                        return false;
                    }
                }
                DropDatabase.For.SqlDatabase(connectionString);
            }

            if (drop || ensureDatabase)
            {
                EnsureDatabase.For.SqlDatabase(connectionString);
            }

            var upgradeEngineBuilder = DeployChanges.To
                .SqlDatabase(connectionString, null) //null or "" for default schema for user
                .LogToConsole();

            addScripts(upgradeEngineBuilder);

            if (withTransaction)
            {
                upgradeEngineBuilder = upgradeEngineBuilder.WithTransaction();
            }
            else if (withTransactionPerScript)
            {
                upgradeEngineBuilder = upgradeEngineBuilder.WithTransactionPerScript();
            }

            var upgrader = upgradeEngineBuilder.Build();

            Console.WriteLine("Is upgrade required: " + upgrader.IsUpgradeRequired());

            if (generateReport)
            {
                upgrader.GenerateUpgradeHtmlReport("MigrationReport.html");
            }
            else
            {
                var result = upgrader.PerformUpgrade();

                // Display the result
                if (result.Successful)
                {
                    Console.ForegroundColor = ConsoleColor.Green;
                    Console.WriteLine("Success!");
                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.Error.WriteLine(result.Error);
                    Console.Error.WriteLine("Failed!");
                    ret = false;
                }
                Console.ResetColor();
            }
            return ret;

        }

        /// <summary>
        /// Migrates the database.
        /// </summary>
        /// <param name="serverInstance">The server instance.</param>
        /// <param name="database">The database.</param>
        /// <param name="scriptPrefix">The script prefix.</param>
        /// <param name="testDataPrefix">The test data prefix.</param>
        /// <param name="legacyDataPrefix">The legacy data prefix.</param>
        /// <param name="migrate">if set to <c>true</c> [migrate].</param>
        /// <param name="testData">if set to <c>true</c> [test data].</param>
        /// <param name="legacyData">if set to <c>true</c> [legacy data].</param>
        /// <param name="ensureDatabase">if set to <c>true</c> [ensure database].</param>
        /// <param name="drop">if set to <c>true</c> [drop].</param>
        /// <param name="noConfirmDrop">if set to <c>true</c> [no confirm drop].</param>
        /// <param name="withTransaction">if set to <c>true</c> [with transaction].</param>
        /// <param name="withTransactionPerScript">if set to <c>true</c> [with transaction per script].</param>
        /// <param name="generateReport">if set to <c>true</c> [generate report].</param>
        /// <param name="user"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        /// <exception cref="ArgumentException">Must supply scriptPrefix, testdataPrefix</exception>
        public static bool MigrateDatabase(string serverInstance,
            string database,
            string scriptPrefix,
            string testDataPrefix,
            string legacyDataPrefix,
            bool migrate,
            bool testData,
            bool legacyData,
            bool ensureDatabase,
            bool drop,
            bool noConfirmDrop,
            bool withTransaction,
            bool withTransactionPerScript,
            bool generateReport,
            string user,
            string password)
        {
            if (string.IsNullOrWhiteSpace(scriptPrefix) || string.IsNullOrWhiteSpace(testDataPrefix))
            {
                throw new ArgumentException("Must supply scriptPrefix, testdataPrefix");
            }

            if ((!migrate && !testData && !legacyData) || string.IsNullOrWhiteSpace(serverInstance))
            {
                Console.WriteLine("Missing parameters. Use -h for help");
                return false;
            }
            return MigrateDatabase((upgradeEngineBuilder) =>
            {
                if (migrate)
                {
                    upgradeEngineBuilder.WithScriptsEmbeddedInAssembly(
                        Assembly.GetEntryAssembly(),
                        script => script.StartsWith(scriptPrefix),
                        new SqlScriptOptions() { ScriptType = ScriptType.RunOnce, RunGroupOrder = 0 });
                }

                if (testData)
                {
                    upgradeEngineBuilder.WithScriptsEmbeddedInAssembly(
                        Assembly.GetEntryAssembly(),
                        script => script.StartsWith(testDataPrefix),
                        new SqlScriptOptions() { ScriptType = ScriptType.RunOnce, RunGroupOrder = 1 });
                }

                if (legacyData)
                {
                    upgradeEngineBuilder.WithScriptsEmbeddedInAssembly(
                        Assembly.GetEntryAssembly(),
                        script => script.StartsWith(legacyDataPrefix),
                        new SqlScriptOptions() { ScriptType = ScriptType.RunOnce, RunGroupOrder = 2 });
                }
            },
            serverInstance, database, ensureDatabase, drop, noConfirmDrop, withTransaction, withTransactionPerScript, generateReport, user, password);

        }
    }
}