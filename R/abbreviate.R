#' Abbreviate strings or tokens
#' 
#' Abbreviates strings or string tokens by matching against a dictionary
#' 
#' @param string character; string to attempt to abbreviate
#' 
#' @param dict dictionary-like object; uses global options 
#' 'confirm.abbreviations' or else the \code{\link{abbreviations}}
#' 
#' @param tokenizer character; separator to split strings with, usually 
#' \code{'_'} or \code{' '}. If \code{NULL}, the default, strings will not be
#' split.
#' 
# @param ... additional arguments passed to \code{\link{lookup}}.
# 
#' x can be adorned with match modifiers to control the type of match. See 
#' \code{\link{lookup}} for details.
#' 
#' If there is no matching entry for the token in the dictinary, no 
#' substitution is used. 
#' 
#' @return 
#'   character; string with elements matching \code{dict} replaced 
#' 
#' @seealso 
#'   \code{\link{lookup}} \cr
#'   \code{\link{abbreviations}} 
#'      
#' @examples
#'   string <- c( 'foo bar', 'foo amount', 'amount', 'amount count date' )
#'   
#'   # Attempts to lookup entire string
#'   string  %>% abbreviate   
#'   
#'   # Tokenizes sting and matches against the token
#'   string %>% abbreviate(tokenizer=" ")
#'   
#' @import magrittr
#' @export

abbreviate <- function( 
  string
  , dict=getOption( 'abbreviations', abbreviations )
  , tokenizer=NULL
) { 

  # SPLIT string BY tokenizer 
  if( ! is.null(tokenizer) ) {
    
    strings <- str_split(string, tokenizer)

    for ( i in 1:length(strings) ) { 
      strings[[i]] <- strings[[i]] %>% sapply( function(x) 
        x %>% 
          exact  %>% 
          ignore.case  %>% 
          lookup(dict, missing=x ) %>% 
          head(1) 
      )
    }
    
    # RETOKEN
    string <- strings %>% sapply( function(x) paste0( x, collapse=tokenizer ) )
  
  # DO NOT TOKENIZE  
  } else { 
  
    for( i in 1:length(string) ) {
      string[[i]] <- string[[i]] %>% 
                     exact  %>%  
                     ignore.case %>%  
                     lookup( dict, missing=string[[i]] ) %>%
                     head(1)
    }               
  
  }
  
  return(string)
  
}
