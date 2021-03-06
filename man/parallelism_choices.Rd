% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/config.R
\name{parallelism_choices}
\alias{parallelism_choices}
\title{Function \code{parallelism_choices}}
\usage{
parallelism_choices()
}
\value{
Character vector listing the types of parallel
computing supported.
}
\description{
List the types of supported parallel computing.
}
\details{
Run \code{make(..., parallelism = x, jobs = n)} for any of
the following values of \code{x} to distribute targets over parallel
units of execution.
\describe{
 \item{"mclapply"}{uses multiple processes in a single R session. 
 This is single-node, (potentially) multicore computing.
 Does not work on Windows for \code{jobs > 1}
 because \code{\link{mclapply}()} is based on forking.}
 \item{"Makefile"}{uses multiple R sessions
 by creating and running a Makefile. 
 The Makefile is NOT standalone.
 DO NOT run outside of \code{\link{make}()} or \code{\link{make}()}.
 Windows users will need to download and intall Rtools.
 As explained in the vignettes, you can use the \code{prepend}
 to \code{\link{make}()} or \code{\link{make}()} to distribute
 targets over multiple nodes of a supercomputer. Use this 
 approach for true distributed computing.}}
}

