% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connect_db.R
\name{dbConnect}
\alias{dbConnect}
\title{Connect to MoE database}
\usage{
dbConnect(server = "learnerbds.db.moe.govt.nz", database = "LearnerBDS")
}
\arguments{
\item{server}{Address of server - defaults to: learnerbds.db.moe.govt.nz}

\item{database}{Name of database - defaults to: LearnerBDS}
}
\value{

}
\description{
Runs the initial connection to the Microsoft SQL Server database. Default parameters are
set to connect to the Learner BDS.
}
\details{
The connection uses the current users Windows Authentication Key, so no username or
password is required.
}
\examples{
dbConnect()
dbConnect(server="learnerbds.db.moe.govt.nz", database="LearnerBDS")
}
