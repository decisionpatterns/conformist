#' Exact  
#' 
#' ensure that pattern matches the entire pattern and not any substring
#' 
#' @param pattern string specifying a search pattern. Pattern modifiers can 
#' be used, such as \code{\link{exact}}
#' 
#' @details
#'   Simply wraps a patterns between \code{"^"} and \code{"$"} ensuring that
#'   the regular expression matches the entire pattern.
#' 
#' @note 
#'   This is a poor substitute for being implemented within \code{stringr}.  See
#'   \url{https://github.com/hadley/stringr/issues/55}
#' 
#' @references
#'   \url{https://github.com/hadley/stringr/issues/55}
#'   
#' @export   

exact <- function(pattern) paste0( "^", pattern, "$" )
