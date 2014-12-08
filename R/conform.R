#' Conform a data.frame or data.table to DP naming standards.
#'  
#' DP naming standards are lower case names with underscores('_') instead
#' of periods('.').
#'  
#' @note This function is idempotent -- multiple application of the
#' function do not change the results. 
#' 
#' @param x object. Object to condorm usually a data.frame, data.table or
#' character vector
#' @param ... Other objects passed to the next methods.
#' 
#' @return data frame that has been conformed to DP standards
#' @author Christopher Brown
#' 
#' @return same type of object.
# conform <- function( data ) {
#   data <- data.table(data)
#   setnames( data, names(data), tolower(names(data)) )
#   setnames( data, names(data), gsub( "\\.", "_", names(data) ) )
#   return(data)
# }
#' Makes a standardized name for the arguments 
#' 
#' The standard naming convention to:
#'  - use all lower.case charcters for names
#'  - replace '.' with '_'
#'  - replace ' ' with '_'
#'  
#'  Name suffixes:
#'  - _date => _dt
#'  - _amount => _amt
#'  - _count => _cnt
#' 
#' There are special meaning in the conformed names.
#' 
#' @author Christopher Brown
#' @rdname conform
#' @export

conform <- function(x, ...) UseMethod( "conform" ) 

#' @rdname conform
# @method conform character
#' @export
conform.character <- function(x, ...) {
  
    x <- tolower(x)
  
    x <- make_names( x, unique = TRUE )
  
  # These must follow make_names
    x <- gsub( "_date$", "_dt", x)
    x <- gsub( "_count$", "_cnt", x)
    x <- gsub( "_amount$", "_amt", x)

  return(x)
  
}


#' @rdname conform
#' @export
conform.data.frame <- function(x, ...) {
  names(x) <- conform( names(x) )
  return(x)
}


#' @rdname conform
#' @import data.table
#' @export
conform.data.table <- function(x, ...) {
  setnames( x, names(x), conform(names(x)) )
  return(x)
}
  
