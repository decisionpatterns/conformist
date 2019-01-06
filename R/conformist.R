#' Default name-conforming function 
#' 
#' Changes (names) to conformed standard. 
#' 
#' @param x object to be conformed. 
#' 
#' @export

conformist <- function(x)
  x %>% 
    stringi::stri_trim_both()      %>%  # Remove white-space
    abbreviate( tokenizer="[_ ]" ) %>%  # Break into tokens
    lettercase::str_snake_case()   %>%  # Snake case
    lettercase::make_names()            # Snake-case names  


