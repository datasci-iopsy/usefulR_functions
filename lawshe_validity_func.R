rm(list = ls())

setwd("~/Dropbox/Graduate Courses/Psychometrics/R CodeHW")

library(psych)
library(lessR)

data <- read.csv("CVR Task.csv", header = T) #read in the data

#recode items - 3 = 1; 1s and 2s = 0
NewData1 <- Recode(c(x3:x9), old = c(1), new = 0, data=data)
NewData2 <- Recode(c(x3:x9), old = c(2), new = 0, data=NewData1)
f.data <- Recode(c(x3:x9), old = c(3), new = 1, data=NewData2) #

rm(NewData1, NewData2)

write.csv(f.data, file = "f.data.csv", na="") #x10 is sum of essential ratings

final <- read.csv("f.data.csv") #final dataframe
#final excel document is uploaded with CVRs computed

cvr <- function(x,y) {
      return(((x-y)/2) / y/2)
} #my attempt to write a function. keep working on this so I don't have to 
#switch back and forth from excel....potential loop?
