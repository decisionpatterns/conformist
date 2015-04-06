library(magrittr)
library(testthat)
library(lettercase)

context( "abbreviations" )

  abbreviations  %>% expect_is('Searchable')
  abbreviations %>% length %>% expect_more_than(2000)
  abbreviations[ 'Product' ]  %>% magrittr::equals("PROD") %>% any %>% expect_true
  
  
  
  
  