mutate2 <- function(data, .vars, .funs) {
    stopifnot(length(.vars) == length(.funs))
    for (i in seq_along(.vars)) {
        data <- mutate_at(data, .vars[[i]], .funs[[i]])
    }
    data
}