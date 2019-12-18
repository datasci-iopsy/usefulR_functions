#this is something to try to build out even further!
#install.packages("lavaan")
library(lavaan)

sem_loadings <- function(x, ...){
     require(tidyverse)
     
     if(is.data.frame(x = "FALSE")) {stop('obj is not a data frame')}
     # x must be a dataframe
     # in this code standardizedSolution output from lavaan should work
     
     #specific for factor loadings
     x %>% 
          select(lhs, op, rhs, est.std, se, pvalue) %>% 
          mutate(est.std = round(est.std, 2),
                 se = round(se, 2),
                 pvalue = round(pvalue, 3)) %>%
          rename(" " = 1, "Operation" = op, "-" = 3, 
                 "Std. Estimate" = 4, se = 5, pvalue = 6)
     
     #return a data frame
}