#' List Main Catalog Objects
#'
#' @param connection connection object returned from dbConnect()
#'
#' @return
#' @export
#' @importFrom odbc odbcListObjects
#'
#' @examples
#' listMainObjects(conn)
listMainObjects <- function(connection) {
  return(odbc::odbcListObjects(connection))
}

#' Lists table names inside database
#'
#' @param connection connection object returned from dbConnect()
#' @param databaseName name of database - defaults to 'LearnerBDS'
#' @param schema schema name - defaults to 'dbo'
#'
#' @return
#' @export
#' @importFrom odbc odbcListObjects
#'
#' @examples
#' listDatabaseTables(conn)
#' listDatabaseTables(conn, databaseName="MyDatabase", schema="dbo")
listDatabaseTables <- function(connection, databaseName="LearnerBDS", schema="dbo") {
  return(odbc::odbcListObjects(connection, catalog=databaseName, schema=schema))
}


#' Lists column names of table
#'
#' @param connection connection object returned from dbConnect()
#' @param tableName name of table as shown in database
#' @param databaseName name of database - defaults to 'LearnerBDS'
#' @param schema schema name - defaults to 'dbo'
#'
#' @return
#' @export
#' @importFrom odbc odbcListColumns
#'
#' @examples
#' listTableColumnNames(conn, 'Gender')
#' listTableColumnNames(conn, 'MyTableName', databaseName='MyDatabase', schema='dbo')
listTableColumnNames <- function(connection, tableName, databaseName="LearnerBDS", schema="dbo") {
  return(odbc::odbcListColumns(conn, catalog=databaseName, schema=schema, table=tableName))
}

