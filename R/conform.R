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
#' \code{conform} provides a very abstract way to ensure that all names
#' follow a predefined convention.   
#'
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
#' @return same type of object as 
#' 
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
#' @examples
#'   data(iris)
#'   conform(iris)
#' 
#' @rdname conform
#' @export

conform <- function( 
    x
  # , dict=getOption('conform.dictionary', NULL)
  # , tokenizer=NULL
  , ...
) UseMethod( "conform" ) 


#' @rdname conform
#' @import lettercase

conform.character <- function(
  x
  , fun = getOption(
        'conform'
      , . %>% 
          abbreviate(tokenizer=" ") %>% 
          lettercase::str_snake_case  %>% 
          lettercase::make_names
    )
  # , dict=getOption('conform.dictionary', NULL)
  # , tokenizer = NULL
  , ...
) {

  return( fun(x) )
  
}



#' @rdname conform
conform.data.frame <- function(
  x
  # , dict=getOption('conform.dictionary', NULL)
  # , tokenizer = NULL
  , ...
) {
  names(x) <- conform( names(x), ... )
  return(x)
}



#' @rdname conform
#' @import data.table
conform.data.table <- function(
  x
  # , dict=getOption('conform.dictionary', NULL)
  # , tokenizer = NULL
  , ...
) {
  setnames( x, names(x), conform(names(x), ...) )
  return(x)
}
