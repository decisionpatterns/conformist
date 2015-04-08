# Internal, non-exported functions 

#' load abbreviations 
#' 
#' @examples
#'   system.file( "abbreviations.txt", package="conformist") %>%
#'   .load_abbreviations
#'   
#'   "data-raw/abbreviations.txt"  %>% .load_abbreviations -> x
#'  
#'  # 
#'   abbreviations <-
#'     "data-raw/abbreviations.txt"  %>% 
#'     .load_abbreviations %>%
#'      searchable %>%
#'      ignore.case
#'     
#'   devtools::use_data( abbreviations )
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