#Function to change (if all anchors are the same) from factors into numbers

OnetoSixtyTwo <-  apply(d.full[,1:62], 2, function(x) as.numeric(factor(x,
levels= c("Strongly disagree",
"Somewhat disagree",
"Neither agree nor disagree",
"Somewhat agree",
"Strongly agree"))))