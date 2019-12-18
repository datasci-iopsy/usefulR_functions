#changes factors or strings to num/dbls
#default is a 5-point Likert-type scale

unfactorise = function(x) {
     case_when(
          x %in% c("Strongly disagree", ...) ~ 1,
          x %in% c("Somewhat disagree", ...) ~ 2,
          x %in% c("Neither agree nor disagree", ...) ~ 3,
          x %in% c("Somewhat agree", ...) ~ 4,
          x %in% c("Strongly agree", ...) ~ 5
          )
}

#example: 
#sapply function across rows 1 thru 32
datNew = data.frame(sapply(datRaw[, 1:32], unfactorise))
head(dat)