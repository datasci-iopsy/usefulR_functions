#This function will allow you to turn all factor or word based responses into 
#numerical responses for analyses. 

require(dplyr)

factorise <- function(x) {
      case_when(
                x %in% c("Strongly disagree") ~ 1,
                x %in% c("Disagree") ~ 2,
                x %in% c("Neither agree nor disagree") ~ 3,
                x %in% c("Somewhat agree") ~ 4,
                x %in% c("Strongly agree") ~ 5)
}

new_df <- as.data.frame(sapply(old_df, factorise))