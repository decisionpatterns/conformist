# Internal, non-exported functions 

#' load abbreviations 
#' 
#' @examples
#'   system.file( "abbreviations.txt", package="conformist") %>%
#'   .load_abbreviations
#'   
#'   "data-raw/abbreviations.txt"  %>% .load_abbreviations -> x
#'  
#'  # TO 
#'   abbreviations <-
#'     "data-raw/abbreviations.txt"  %>% 
#'     .load_abbreviations 
#'     save( abbreviations, file="data/abbreviations.rda" )
#'     
#' @rdname internal

.load_abbreviations <- function(x) { 

 #  message(   system.file( "abbreviations.txt", package="conformist") )
  abbr_table = read.table( 
      x    
    , sep="\t"
    , header=TRUE
    , as.is=TRUE 
  )

  abbreviations <- stats::setNames( abbr_table$abbreviation, abbr_table$word )
  
  return(abbreviations)
}

# longform <- stats::setNames( abbr_table$abbreviation, abbr_table$word )