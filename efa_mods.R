#this is a quick-n-easy function to run multiple EFA models using specific arguments!

efa_mods_fun = function(x, n_models = NULL, ...){
    
    if (!is.data.frame(x))
        stop("x must be a dataframe with numeric values")
    
    efa_models = list()
    
    for (i in seq(n_models)){
        efa_models[[i]] = fa(x, nfactors = i, rotate = "oblimin", fm = "pa", 
                             use = "pairwise")
    }
    return(efa_models)
}