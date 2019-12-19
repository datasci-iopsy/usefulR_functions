#this can be used to rm objs in the env by specific patterns 
#grep allows for 'and' and 'or' arguments using '&' and '|' respectively
#NOTE: the aforementioned '|' symbol is a pipe not the chr "I"
#
#example:
rm(list = ls()[grep("dat|meta", ls())])

#one can also specify patterns with base R
rm(list = ls(pattern = "dat|meta"))