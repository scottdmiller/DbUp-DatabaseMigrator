using static Indy.DatabaseMigration.DatabaseMigration;

namespace DatabaseMigration
{
    static class Program
    {
        /// <summary>
        /// Migrate the database.  Supply --migrate, --testdata, or --legacydata
        /// </summary>
        /// <param name="dbName">Name of database to create or migrate</param>
        /// <param name="ensureDatabase">Set to create the database.</param>
        /// <param name="migrate">Set to migrate the database.</param>
        /// <param name="testData">Set to load testdata.</param>
        /// <param name="withTransaction">Use the WithTransaction DbUp option.</param>
        /// <param name="withTransactionPerScript">Use the WithTransactionPerScript DbUp option.</param>
        /// <param name="generateReport">Generate the DbUp HTML report, .\MigrationReport.html.</param>
        /// <param name="drop">Drop the database (will do --ensure-database)</param>
        /// <param name="noConfirmDrop">Don't prompt to confirm drop if --drop is used.</param>
        /// <param name="user">Username for non-integrated auth, must also supply password</param>
        /// <param name="password">Password for non-integrated auth</param>
        /// <param name="serverInstance">The SQL Server/Instance. Defaults to '.'</param>
        public static int Main(
            string dbName,
            bool ensureDatabase = false,
            bool migrate = false,
            bool testData = false,
            bool legacyData = false,
            bool withTransaction = false,
            bool withTransactionPerScript = false,
            bool generateReport = false,
            bool drop = false,
            bool noConfirmDrop = false,
            string user = "",
            string password = "",
            string serverInstance = ".")
        {
            return MigrateDatabase(
                serverInstance,
                dbName,
                "DatabaseMigration.scripts.",
                "DatabaseMigration.testdata.",
                "DatabaseMigration.legacydata.",
                migrate,
                testData,
                legacyData,
                ensureDatabase,
                drop,
                noConfirmDrop,
                withTransaction,
                withTransactionPerScript,
                generateReport,
                user,
                password) ? 0 : 9;
        }
    }
}