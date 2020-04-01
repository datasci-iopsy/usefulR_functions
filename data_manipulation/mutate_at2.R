#this function can be used when wanting to apply multiple functions with the
#original `mutate_at()` function in the dplyr package

library(dplyr)

mutate_at2 <- function(data, .vars, .funs) {
    stopifnot(length(.vars) == length(.funs))
    
    for (i in seq_along(.vars)) {
        data <- mutate_at(data, .vars[[i]], .funs[[i]])
        }
    data
}

#example: 
mutate_at2(
    list(vars(starts_with("insesh_")), vars(ends_with("_event")), 
         vars(ends_with("_name"))), 
    list(~ parse_number(.) / 100, ~ replace_na(., "NONE"), 
         ~replace_na(., "No Holiday"))
) %>% 
    mutate_if(is.character, as.factor)

#each specified variable must have a specific function called