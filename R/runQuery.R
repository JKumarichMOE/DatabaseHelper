#' Runs SQL query on connection
#'
#' @param connection connection object returned from dbConnect()
#' @param query SQL query string
#'
#' @return
#' @export
#' @importFrom odbc dbGetQuery
#'
#' @examples
#' runSQLQuery(
#'   conn,
#'   query = '
#'   SELECT * FROM SchoolLeaver
#'   WHERE SchoolLeaverYear >= 2016
#'   '
#' )
#'
#' runSQLQuery(conn, queryString)
#'
runSQLQuery <- function(connection, query) {
  return(odbc::dbGetQuery(connection, query))
}


#' Loads code from SQL file into R string to use in sql queries
#'
#' Note: The address must contain forward slashes only ('/'), any back slashes ('\') should be converted to forward
#'
#' Code adapted from https://stackoverflow.com/questions/44853322/how-to-read-the-contents-of-an-sql-file-into-an-r-script-to-run-a-query
#'
#' @param filepath location of the .sql file
#'
#' @return
#' @export
#'
#' @examples
#' LoadSQLFile('/Queries/PerformanceScore_Subject.sql')
loadSqlFile <- function(filepath){
  con = file(filepath, "r")
  sql.string <- ""

  while (TRUE){
    line <- readLines(con, n = 1)

    if ( length(line) == 0 ){
      break
    }

    line <- gsub("\\t", " ", line)

    if(grepl("--",line) == TRUE){
      line <- paste(sub("--","/*",line),"*/")
    }

    sql.string <- paste(sql.string, line)
  }

  close(con)
  return(sql.string)
}


#' Runs SQL query on database
#'
#' Note: The filepath must contain forward slashes only ('/'), any back slashes ('\') should be converted to forward
#'
#' @param conn connection object returned from dbConnect()
#' @param filepath location of the .sql file
#'
#' @return
#' @export
#'
#' @examples
#' LoadSQLFile(conn, '/Queries/PerformanceScore_Subject.sql')
loadTableFromSqlFile <- function(connection, filepath) {
  return(odbc::dbGetQuery(connection, loadSqlFile(filepath)))
}

