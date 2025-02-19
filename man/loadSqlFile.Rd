% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runQuery.R
\name{loadSqlFile}
\alias{loadSqlFile}
\title{Loads code from SQL file into R string to use in sql queries}
\usage{
loadSqlFile(filepath)
}
\arguments{
\item{filepath}{location of the .sql file}
}
\value{

}
\description{
Note: The address must contain forward slashes only ('/'), any back slashes ('\') should be converted to forward
}
\details{
Code adapted from https://stackoverflow.com/questions/44853322/how-to-read-the-contents-of-an-sql-file-into-an-r-script-to-run-a-query
}
\examples{
LoadSQLFile('/Queries/PerformanceScore_Subject.sql')
}
