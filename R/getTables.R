#' Return a full database table
#'
#' @param connection connection variable returned from dbConnect()
#' @param tableName Name of table as shown in database
#'
#' @return
#' @export
#' @importFrom odbc dbGetQuery
#'
#' @examples
#' getTable(conn, 'Decile')
getTable <- function(connection, tableName) {
  return(odbc::dbGetQuery(connection, paste0('SELECT * FROM ', tableName)))
}
