#' Old -> new names map
#' 
#' 
#' 
#' @param data a data set
#' @param fun a function that transforms 'data'
#' 
#' @detail  
#' 
#' @return a table with two columns old, new with the names of the pre- and 
#' post- transformed data.
#'           
#' @examples
#' 
#'   iris %>% name_map(conformist)
#'   iris %>% setDT() %>% name_map(conformist)
#'  
#' @export 

name_map <- function(data, fun)  { 

  nms.old <- data %>% copy() %>% names()
  nms.new <- data %>% copy() %>% conform(fun) %>% names
  ret <- data.frame(old = nms.old, new = nms.new)
  if (is.data.table(data)) 
    setDT(ret)
  ret
  
}