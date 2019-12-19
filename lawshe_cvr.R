#Lawshe's Content Validity Ratio Analysis

#load librraies
library(tidyr)
library(dplyr)
library(readr)
library(tibble)

#read in raw data
# dat = read in dataset!
#
# when conducting CVR, the df should consist of only the items from the measure 
# and the raters endorsement for each item
#
#the dataset will need to be transposed for analysis
# (i.e., variables [items] become rows and each column is a observation [rater])

#data wrangling 
dat_new = as.data.frame(t(dat)) %>% #transpose original df
    slice(-1) %>% #rm first row (if applicable)
    rownames_to_column(var = " ") %>% #empty row name
    rename("Items" = 2) %>% #rename 2nd column
    mutate(" " = sprintf("Q%d" , seq_len(nrow(.)))) %>% #Q+row num for each obs
    rename_at(
        vars(3:14), list(~paste0("Rater", 1:12)) #rename cols 
    ) %>% 
    mutate_at(
        vars(contains("Rater")), #recode responses for each rater column
        list(~case_when(
            . == "Essential" ~ 1, 
            . == "Useful, but not essential" | . == "Not necessary" ~ 0
            ))
        ) %>% 
    mutate(
        "Total Essentials" = rowSums(.[3:14], na.rm = TRUE), #sum essential counts
    )

#create Lawshe's (1975) CVR function
cvr_func = function(tot_essentials, n_raters = NULL, ...) {
    (tot_essentials - (n_raters/2)) / (n_raters/2) 
}

#final dataset 
dat_fnl = dat_new %>% 
    mutate(
        "CVR" = cvr_func(.$`Total Essentials`, n_raters = 12) #new row w/ ratio
    ) %>% 
    filter(CVR > 0) #keep items with positive values; more than half vote essential

data.frame(dat_fnl)
