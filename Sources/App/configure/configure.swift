//import FluentSQLite
import FluentMySQL
import Vapor
import Leaf

/// Called before your application initializes.
///
/// https://docs.vapor.codes/3.0/getting-started/structure/#configureswift
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    /// Register providers first
//    try services.register(FluentMySQLProvider())

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    
    try services.register(LeafProvider())
    config.prefer(LeafRenderer.self, for: TemplateRenderer.self)
    
    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
//    middlewares.use(DateMiddleware.self) // Adds `Date` header to responses
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a SQLite database
//    let sqlite: SQLiteDatabase
//    if env.isRelease {
//        /// Create file-based SQLite db using $SQLITE_PATH from process env
//        sqlite = try SQLiteDatabase(storage: .file(path: Environment.get("SQLITE_PATH")!))
//    } else {
//        /// Create an in-memory SQLite database
//        sqlite = try SQLiteDatabase(storage: .memory)
//    }

    /// Register the configured SQLite database to the database config.
//    var databases = DatabaseConfig()
//    let databaseConfig = MySQLDatabaseConfig(hostname: "127.0.0.1", port: 3306, username: "root", password: "nhat@2018", database: "MySiteSwift")
//
//    databases.add(database: MySQLDatabase(config: databaseConfig), as: .mysql)
//    services.register(databases)
//
    /// Configure migrations
    var migrations = MigrationConfig()
//    migrations.add(model: BlogModel.self, database: .mysql)
    services.register(migrations)

}
