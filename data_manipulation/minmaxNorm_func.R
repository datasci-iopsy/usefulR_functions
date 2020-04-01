#function to apply the MinMax normalization method

normalize = function(x) {
    return(
        (x - min(x)) / (max(x) - min(x))
    )
}