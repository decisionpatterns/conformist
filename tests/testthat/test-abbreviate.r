
context('abbreviate')

"Alaska" %>% abbreviate %>% expect_equal('AK')  
"Virginia" %>% abbreviate %>% expect_equal('VA')
