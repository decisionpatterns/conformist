context('lookup')

dict <- setNames( 1:10, letters[1:10])

"c" %>% lookup(dict) %>% expect_equivalent(3)
"C" %>% lookup(dict) %>% expect_equivalent(NA)
"C" %>% stringr::ignore.case  %>% lookup(dict) %>% expect_equivalent(3)
  
  
lookup( "c", dict )
