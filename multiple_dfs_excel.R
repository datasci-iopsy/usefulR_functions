# create a function to write multiple dataframes into sep sheets 

save_xlsx = function (file, ...) {
     #use 'require' when loading package in function
     require(xlsx, quietly = TRUE)
     objects <- list(...)
     fargs <- as.list(match.call(expand.dots = TRUE))
     objnames <- as.character(fargs)[-c(1, 2)]
     nobjects <- length(objects)
     
     for (i in 1:nobjects) {
          if (i == 1) 
               write.xlsx(objects[[i]], file, sheetName = objnames[i], 
                          row.names = F) 
          else write.xlsx(objects[[i]], file, sheetName = objnames[i], 
                          append = TRUE, row.names = F)
     }
     print(paste("The workbook", file, "has", nobjects, "worksheets."))
}