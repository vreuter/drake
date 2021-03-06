% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read.R
\name{read_graph}
\alias{read_graph}
\title{Function \code{read_graph}}
\usage{
read_graph(plot = TRUE, path = getwd(), search = TRUE)
}
\arguments{
\item{plot}{logical, whether to plot the graph or 
simply return the graph as an igraph object.}

\item{path}{Root directory of the drake project,
or if \code{search} is \code{TRUE}, either the
project root or a subdirectory of the project.}

\item{search}{logical. If \code{TRUE}, search parent directories
to find the nearest drake cache. Otherwise, look in the
current working directory only.}
}
\value{
either a plot or an igraph object, depending
on \code{plot}
}
\description{
Read the dependency graph of your targets
from your last attempted call to \code{\link{make}()}.
}
\seealso{
\code{\link{read_config}}
}

