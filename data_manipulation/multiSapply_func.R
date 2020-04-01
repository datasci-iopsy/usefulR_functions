#useful when wanting to call multiple functions using sapply

multi_sapply = function(...) {
    arglist <- match.call(expand.dots = FALSE)$...
    var_names <- sapply(arglist, deparse)
    has_name <- (names(arglist) != " ")
    
    var_names[has_name] = names(arglist)[has_name]
    arglist <- lapply(arglist, eval.parent, n = 2)
    
    x <- arglist[[1]]
    arglist[[1]] <- NULL
    
    result <- sapply(arglist, function (FUN, x) sapply(x, FUN), x)
    
    colnames(result) <- var_names[-1]
    
    return(results)
}

