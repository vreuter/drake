% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cache.R
\name{built}
\alias{built}
\title{Function \code{built}}
\usage{
built(path = getwd(), search = TRUE)
}
\arguments{
\item{path}{Root directory of the drake project,
or if \code{search} is \code{TRUE}, either the
project root or a subdirectory of the project.}

\item{search}{logical. If \code{TRUE}, search parent directories
to find the nearest drake cache. Otherwise, look in the
current working directory only.}
}
\value{
list of imported objects in the cache
}
\description{
List all the built (non-imported) objects in the drake
cache.
}
\seealso{
\code{\link{cached}}, \code{\link{loadd}},
\code{link{imported}}
}

