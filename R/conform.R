#' @import data.table
NULL

#' Conform
#' 
#' Conform an object to internal standards
#'  
#' @param x object. Object to conform usually a data.frame, data.table or
#' character vector
#'  
#' @param ... objects passed to the next method(s).
#' 
#' @param fun function to perform the conformation. The default is to look 
#' for the global conformation function: \code{getOptions('conform')}
#'
#' @details  
#'  
#' \code{conform} provides a very abstract way to ensure that all names
#' follow a predefined convention.   
#'
#' The default conformation ... \cr
#'   trims whitespace, 
#'   abbreviates words, 
#'   enforces snake_case. 
#'   and makes_names
#'   
#' @note
#' DP naming standards are lowercase, underscores('_') for whitespace 
#' (not periods('.'), leading dot is retained 
#'  
#' @note This function is \strong{idempotent} -- multiple application of the
#' function do not change the results.#' @return data frame that has been 
#' conformed to DP standards
#' 
#' @author Christopher Brown
#' 
#' @return same type of object as \code{x} with its property set by conform
#' 
#' @examples
#'   data(iris)
#'   conform(iris)
#' 
#' @rdname conform
#' @export

conform <- function( x, ...) UseMethod( "conform" ) 

.conform.default <-
function(x) 
  lettercase::make_names( str_snake_case( abbreviate( stringi::stri_trim_both(x), tokenizer="[_ ]") ) )

#' @rdname conform
#' @export
conform.character <- function(
  x
  , fun = getOption(
        'conform'
      , function(x) 
        lettercase::make_names( str_snake_case( abbreviate( stringi::stri_trim_both(x), tokenizer="[_ ]") ) )

    )
  , ...
) {

  return( fun(x) )
  
}



#' @rdname conform
#' @export
conform.data.frame <- function(x, ...) {
  names(x) <- conform( names(x), ... )
  return(x)
}


#' @rdname conform
#' @export
conform.data.table <- function(x, ...) {
  setnames( x, names(x), conform(names(x), ...) )
  return(x)
}


