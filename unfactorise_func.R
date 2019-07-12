unfactorise <- function(x) {
     case_when(x %in% c("Strongly disagree", "Very Slightly", 
                        "To a very small extent", "Never", "Very dissatisfied") ~ 1,
               x %in% c("Somewhat disagree", "A Little", "To a small extent", 
                        "Sometimes", "Somewhat dissatisfied") ~ 2,
               x %in% c("Neither agree nor disagree", "Moderately", 
                        "To a moderate extent", "About half the time", 
                        "Neither satisfied nor dissatisfied") ~ 3,
               x %in% c("Somewhat agree", "Quite a Bit", "To a large extent", 
                        "Most of the time", "Somewhat satisfied") ~ 4,
               x %in% c("Strongly agree", "Extremely", "To a very large extent", 
                        "Always", "Very satisfied") ~ 5)
}