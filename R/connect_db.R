#' Connect to MoE database
#'
#' Runs the initial connection to the Microsoft SQL Server database. Default parameters are
#' set to connect to the Learner BDS.
#'
#' The connection uses the current users Windows Authentication Key, so no username or
#' password is required.
#'
#' @param server Address of server - defaults to: learnerbds.db.moe.govt.nz
#' @param database Name of database - defaults to: LearnerBDS
#'
#' @return
#' @export
#' @importFrom DBI dbConnect
#' @importFrom odbc odbc
#'
#' @examples
#' dbConnect()
#' dbConnect(server="learnerbds.db.moe.govt.nz", database="LearnerBDS")
dbConnect <- function(server="learnerbds.db.moe.govt.nz", database="LearnerBDS") {
  conn <- tryCatch({
    DBI::dbConnect(
      odbc::odbc(),
      Driver   = "SQL Server",
      Server   = server,
      Database = database,
      Port     = 1433)
  }, error = function(cond) {
    message(
      paste0(
        'Error connecting to database: \n    Server = ', server, '\n    Database = ', database, '\n'
      )
    )
    message(cond)
  })
  return(conn)
}
