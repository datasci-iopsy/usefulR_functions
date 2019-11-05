#this can be used to rm objs in the env by specific patterns
rm(list = ls()[grep(" ", ls())])