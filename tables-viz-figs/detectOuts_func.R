# Outlier removal by the Tukey rules on quartiles +/- 1.5 IQR
# 2017 Klodian Dhana
## https://datascienceplus.com/identify-describe-plot-and-removing-the-outliers-from-the-dataset/
# Edited on 11/28/2019 by Demetrius Green

#outlier detection - boxplot and histogram plots
#this function is used to cap outliers and show respective output
cappedOutliers = function(dt, var, gtitle = NULL) {
    require(ggplot2)
    
    gtitle = as.character(gtitle)
    var_name = eval(substitute(var), eval(dt))
    
    tot = sum(!is.na(var_name))
    na1 = sum(is.na(var_name))
    
    m1 = mean(var_name, na.rm = T)
    
    par(mfrow = c(2, 2))#, oma = c(0, 0, 3, 0))
    
    ggplot(data = iris, aes(y = Sepal.Width)) + 
        geom_boxplot(fill = "slateblue", alpha = .2) + 
        xlab(" ")
    
    ggplot(data = iris, aes(x = Sepal.Width)) + 
        geom_histogram(fill = "slateblue", alpha = .2, stat = "bin", bins = 15, 
                       orientation = "x") + 
        labs(x = "", y = "")
        
            
    
    #boxplot(var_name, main = "With Outliers")
    #hist(var_name, main = "With Outliers", xlab = NA, ylab = NA)
    
    outlier = boxplot.stats(var_name)$out
    mo = mean(outlier)
    
    cap_func = function(x) {
        quants = quantile(x, probs = c(.25, .75), na.rm = TRUE)
        caps = quantile(x, probs = c(.05, .95), na.rm = TRUE)
        H = 1.5 * IQR(x, na.rm = TRUE)
        
        x[x < (quants[1] - H)] <- caps[1] #NA #to replace w/ NAs
        x[x > (quants[2] + H)] <- caps[2] #NA #to replace w/ NAs
        
        return(x)
    }
    
    var_name = ifelse(var_name %in% outlier, cap_func(var_name), var_name)
    
    boxplot(var_name, main = "With Capped Outliers")
    hist(var_name, main = "Without Capped Outliers", xlab = NA, ylab = NA)
    
    title(paste("Outlier Check: ", gtitle), outer = TRUE)
    
    na2 = sum(is.na(var_name))
    
    #message("Outliers Identified: ", na2 - na1, " from ", tot, " Observations")
    #message("Proportion (%) of Outliers: ", round((na2 - na1) / tot * 100), 2, "%")
    message("Mean of the Outliers: ", round(mo, 2))
    
    m2 <- mean(var_name, na.rm = T)
    
    message("Mean without Capping Outliers: ", round(m1, 2))
    message("Mean if Outliers are Capped: ", round(m2, 2))
    
    dt[as.character(substitute(var))] = invisible(var_name)
    assign(as.character(as.list(match.call())$dt), dt, envir = .GlobalEnv)
    message("Outliers successfully capped", "\n")
    
    return(invisible(dt))
}

