% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/find.R
\name{find_cache}
\alias{find_cache}
\title{Function \code{find_cache}}
\usage{
find_cache(path = getwd())
}
\arguments{
\item{path}{starting path for search back for the cache.
Should be a subdirectory of the drake project.}
}
\value{
File path of the nearest drake cache or \code{NULL}
if no cache is found.
}
\description{
Return the file path of the nearest drake
cache (searching upwards for directories containing a drake cache).
}
\seealso{
\code{\link{plan}}, \code{\link{make}},
}

