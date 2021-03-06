% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph.R
\name{plot_graph}
\alias{plot_graph}
\title{Function \code{plot_graph}}
\usage{
plot_graph(plan, targets = plan$target, envir = parent.frame())
}
\arguments{
\item{plan}{workflow plan data frame, same as for function 
\code{\link{make}()}.}

\item{targets}{names of targets to bulid, same as for function
\code{\link{make}()}.}

\item{envir}{environment to import from, same as for function
\code{\link{make}()}.}
}
\description{
Plot the dependency structure of your workflow
}

