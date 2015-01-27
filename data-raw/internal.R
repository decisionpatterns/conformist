# Internal, non-exported functions 

#' load abbreviations 
#' 
#' @rdname internal

.load_abbreviations <- function() { 

 #  message(   system.file( "abbreviations.txt", package="conformist") )
  abbr_table = read.table( 
    system.file( "abbreviations.txt", package="conformist")
    , sep="\t"
    , header=TRUE
    , as.is=TRUE 
  )

  abbreviations <- stats::setNames( abbr_table$abbreviation, abbr_table$word )
  
  return(abbreviations)
}

# longform <- stats::setNames( abbr_table$abbreviation, abbr_table$word )