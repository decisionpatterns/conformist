library(testthat)
library(conformist)
library(magrittr)

context('abbreviate')


# STATES
  "Alaska" %>% abbreviate %>% expect_equal('AK')  
  "Virginia" %>% abbreviate %>% expect_equal('VA')


# MULTIPLE ELEMENTS
  string <- c( 'foo bar', 'foo amount', 'amount', 'amount count date' )
  
  # Attempts to lookup entire string
  string  %>% abbreviate  %>% extract2(3) %>% 
  expect_equal('AMT')
  
  # Tokenizes sting and matches against the token
  string %>% abbreviate(tokenizer=" ") %>% extract2(4) %>% 
  expect_equal('AMT CNT DT')
  
  