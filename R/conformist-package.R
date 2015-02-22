#' conformist
#'
#' The \strong{conformist} package is used to conform data according to one
#' or moe predetermined. At the present time, this mostly applies to names of 
#' variables and values.
#' 
#' 
#' @section Utilities:
#' 
#' There are three main utilities: \cr
#' 
#' \code{\link{lookup}} is a sophisticated lookup utility based on the \code{stringr}
#' package. This allows looking up the values in any named object, i.e. the 
#' object has a \code{names} method. This interface is likely to change. \cr
#' 
#' \code{\link{abbreviations}} maps strings and tokens into abbreviations according to
#' a dictionary of abbreviations. A 2,634 long abbreviation is included.
#' 
#' \code{\link{conform}} is the workhorse of the package. It is designed so that the 
#' developer can set a simple set of rules in the global option \code{conform}
#' and applies by calling the \code{conform} functions, usually with no 
#' arguments. This is greatly facilitated by the pipe operator \code{\%>\%}, both
#' for defining the conformation as well as implementing it.
#' 
#' @note
#' It is very likely that the interface is likely to change and functions 
#' maybe refactored possibly into other packages. \cr
#' 
#' \code{lookup} might become part of a 'dictionary' or 'lookup' package.
#' 
#' \code{abbreviations} might become part of the \code{lettercase} package and 
#' expand its scope to handling abbreviations in addition to capitalization and 
#' spacing.
#' 
#' @name conformist
#' @import magrittr
#' @docType package

NULL


. <- NULL # OVERZEALOUT CHECKING