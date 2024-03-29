context('conform')
library(magrittr)
library(lettercase)

data(iris)
iris %>% conform %>% names %>% tail(1) %>% expect_equal( 'spcs' )
   
iris %>% conform( fun= .  %>% str_uppercase ) %>% names  %>% tail(1) %>%
  expect_equal( 'SPECIES')
  

"Mission Of Burma" %>% conform %>% expect_equal( "mission_of_burma" ) 
"Mission-Of-Burma" %>% conform %>% expect_equal( "mission_of_burma" ) 
"Mission.Of.Burma" %>% conform %>% expect_equal( "mission_of_burma" ) 
  
"Catch-22" %>% conform %>% expect_equal( "catch_22" ) 


# TEST TRIM WHITE SPACE
  " hello world " %>% conform %>% expect_equal('hello_wrld')
