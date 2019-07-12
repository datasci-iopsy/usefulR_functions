#function for every ith row
nrow_gen <- function(x,y) {
     n <- nrow(x)
     b <- seq(1,n,y)
     r <- length(b)
     
     c = data.frame() 
     {
          for (i in 1:r) {
               abc <- x[b[i], ]
               c <- rbind(c, abc)
          }
          return(c)
     }
}