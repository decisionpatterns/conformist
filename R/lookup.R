#' Lookup and entry in an object with names 
#'
#' @param x string; one-element character vector 
#' 
#' @param object object that has a names attribute that is used to look up the 
#' associated values. 
#' 
#' @param missing; value to return if the 
#' 
#' Looks up and returns the item(s) in \code{dict} matching the pattern 
#' given by \code{x}. If there is no matrching name found, the value  provided 
#' in the \code{missing} argument is used.   
#' 
#' It is not uncommon to set \code{missing} to  
#' 
#' @return 
#'   one or more values looked up by name in the dictionary. There is no 
#'   guarantee that 
#' 
#' @seealso 
#'   \code{\link[stringr]{str_detect}} which is used internally to match 
#'   names
#'    
#' @examples
#'   dict <- 1:26 
#'   names(dict) <- letters
#'   
#'   lookup( ignore.case('M'), dict )    # 13
#'   lookup( 'M', dict )                 # NA
#'   lookup( 'M', dict, 'M' )            # M
#'   
#'   
#' @import stringr
#' @export

lookup <- function( x, dict=getOption('dictionary',abbreviations), missing=NA ) { 

   wh <- stringr::str_detect( names(dict), x ) 
   
   if(all(!wh)) return(missing)
   
   return( dict[wh] )
  
}
