#create a list with freq tables for categorical features/variables

freqList = lapply(df, 
                  function(x) {
                      
                      my_lst = data.frame(table(x))
                      names(my_lst) = c("level", "n")
                      
                      return(my_lst) 
                        }
                    )
freqList
