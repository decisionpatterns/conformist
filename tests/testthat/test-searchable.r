context('lookup')

v <- c( ay=1, bee=2, cee=3 ) 


dict <- v

  dict["bee"]  %T>% 
    expect_named %>%
    expect_equivalent(2)
  
  dict[ "cee" ] %T>%  
    expect_named %>%
    expect_equivalent(3)
  
  dict["CEE"]  %>% 
    expect_equivalent(NA_integer_)
  
  dict["ee"]   %>% 
    expect_equivalent(NA_integer_)



dict <- dict %>% searchable 

  dict["bee"]  %T>% 
    expect_named %>%
    expect_equivalent(2)
  
  dict[ "cee" ] %T>%  
    expect_named %>%
    expect_equivalent(3)
  
  dict["CEE"]  %>% 
    expect_equivalent(NA_integer_)
  
  dict["ee"]   %>% 
    expect_equivalent(NA_integer_)


dict <- dict  %>%  searchable %>% regex 

  dict["bee"]  %T>% 
    expect_named %>%
    expect_equivalent(2)
  
  dict[ "cee" ] %T>%  
    expect_named %>%
    expect_equivalent(3)
  
  dict["CEE"]  %>% 
    expect_equivalent( numeric() )
  
  dict["ee"]   %>% 
    expect_equivalent( v[2:3] )


