#' Abbreviate strings or tokens
#' 
#' Abbreviates strings by (optionally) tokenizing and matching token 
#' against a dictionary
#' 
#' @param string character; string to attempt to abbreviate
#' 
#' @param dict dictionary-like object; uses global options 
#' 'confirm.abbreviations' or else the \code{\link{abbreviations}}
#' 
#' @param tokenizer character; pattern passed to 
#' \code{\link[stringr]{str_split}} to split strings with, usually \code{'_'} 
#' or \code{' '}. If \code{NULL}, the default, strings will not be split. 
#' 
# @param ... additional arguments passed to \code{\link{lookup}}.
# 
#' @details
#' 
#' \code{abbreviate} works by first finding a list of tokens that occur in the 
#' code. 
#' 
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
#'   \code{\link{abbreviations}} \cr
#'   \code{\link[stringr]{str_split}}
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
# @import magrittr
#' @export

abbreviate <- function( 
  string
  , dict      = getOption( 'abbreviations', abbreviations )
  , tokenizer = NULL
) { 

  # SPLIT string BY tokenizer 
  if( ! is.null(tokenizer) ) {
    
    strings <- stringr::str_split(string, tokenizer)

    # IDENTIFY TOKENS TO BE REPLACED
    tokens <- str_split( string, tokenizer ) %>% unlist %>% unique     # get tokens
      
    replacements <- tokens %>%
      sapply( . %>% exact %>% ignore.case %>% lookup(dict) ) %>%  # lookup tokens
      sapply( . %>% extract2(1) ) %>%                             # retain first hit only  
      na.omit
    
    
    # REPLACE TOKENS
    #   Look behind and forward assertions are used to augment the token matching
    if( length(replacements) > 0 ) 
      for( i in 1:length(replacements) ) { 
        pattern <- names(replacements)[[i]]
        pattern <- paste0( "(?<=^|", tokenizer, ")", pattern, "(?=$|", tokenizer, ")" )
        string <- 
          str_replace_all( 
              string
            , pattern = perl(pattern) 
            , replacements[[i]] 
          )
      }
    
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
