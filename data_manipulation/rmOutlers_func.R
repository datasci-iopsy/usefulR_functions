#a nifty set of functions used to remove outliers (by variables) by marking them as NA
#keeping a record of which were outliers 

# 2013 L. Collado Torres
## http://biostat.jhsph.edu/~lcollado/misc/outliers.html
# Edited on 03/26/2010 by Demetrius K. Green

findOuts = function(df, cutoff = 3) {
    ## Calculate the sd
    sds = apply(df, 2, sd, na.rm = TRUE)

    ## Identify the cells with value greater than cutoff * sd (column wise)
    result = mapply(function(d, s) { 
        which(d > cutoff * s)
        },
        data, sds
    )
    result
}

#ex:
outs <- findOuts(data_set)
outs

rmOuts <- function(df, outs) {
    result <- mapply(function(d, o) {
        res <- d
        res[o] <- NA
        return(res)
    }, data, outliers)
    return(as.data.frame(result))
}

#ex:
dataFilt <- removeOutlier(data_set, outs)