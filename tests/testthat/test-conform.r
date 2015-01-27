context('conform')
library(magrittr)

data(iris)
iris %>% conform %>% names %>% tail(1) %>%
  expect_equal( 'spcs' )
   
iris %>% conform( fun= .  %>% str_uppercase ) %>% names  %>% tail(1) %>%
  expect_equal( 'SPECIES')
  
  