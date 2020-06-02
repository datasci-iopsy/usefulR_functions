#in development graphs to figure out what is best for viewing. Option 1 is winner for now

#option 1
#univariate histogram function for variable (one at a time)
var_names = set_names(names(df)[1:n])
hist_func = function(x) {

    ggplot(df, aes(x = .data[[x]])) +
        geom_histogram(fill = "darkblue", 
                       color = "white", 
                       binwidth = 1, 
                       bins = 50) +
        labs(title = paste("Histogram:", x),
             x = "") +
        scale_x_continuous(
            breaks = function(x) seq(ceiling(x[1]), floor(x[2]), by = 1)
        )
    }

# #bar chart function - revert to histogram
# bar_func = function(x, y = NULL) {
#     # if (!is.data.frame(df) || !is_tibble(df))
#     #     stop("df must be a data frame object")
#     
#     g1 = ggplot(dat, aes(x = .data[[x]])) + 
#         geom_bar() +
#         scale_x_continuous(breaks = c(1, 2)) + 
#         theme_gray()
#     
#     if(!is.null(y)) {
#         return(g1 + 
#                    labs(title = paste("Feature of Interest:", x), 
#                         subtitle = paste("Faceted by:", y)) +
#                    facet_wrap(~ .data[[y]]) + 
#                    theme(axis.title.x = element_blank())
#         )
#     } else {
#         return(g1 + 
#                    labs(title = paste("Feature of Interest:", x)) + 
#                    theme(axis.title.x = element_blank()))
#     }
# }


# bar_func = function(data_in, i, j = NULL) {
#     # if (!is.data.frame(df) || !is_tibble(df))
#     #     stop("df must be a data frame object")
#     data = data.frame(x = data_in[[i]])
#     # y = data_in[[j]])
#     
#     g1 = ggplot(data = data, 
#                 aes(x = x)) + 
#         geom_bar() +
#         labs(x = colnames(data_in)[i]) +  
#         # y = colnames(data_in)[j]) + 
#         scale_x_continuous(breaks = c(1, 2)) + 
#         theme_gray()
#     
#     return(g1)
# }
# 
# doPlots = function(data_in, fun, ii, ncol = 3) {
#     pp = list()
#     for (i in ii) {
#         p = fun(data_in = data_in, i = i)
#         pp = c(pp, list(p))
#     }
#     do.call("ggarrange", c(pp, ncol = ncol))
# }
#
# #not run
# doPlots(dat, fun = bar_func, ii = 1:5, ncol = 5)