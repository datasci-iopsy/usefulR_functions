#Function to change (if all anchors are the same) from factors into numbers

OnetoSixtyTwo =  apply(x[, 1:n], 2, 
                       function(x) {
                           as.numeric(factor(x, levels = c("Strongly disagree", 
                                                           "Somewhat disagree", 
                                                           "Neither agree nor disagree", 
                                                           "Somewhat agree", 
                                                           "Strongly agree")
                                             )
                                      )
                           )