out_detect <- function(dt, var) {
    var_name <- eval(substitute(var), eval(dt))
    
    tot <- sum(!is.na(var_name))
    na1 <- sum(is.na(var_name))
    
    m1 <- mean(var_name, na.rm = T)
    
    par(mfrow = c(2, 2), oma = c(0, 0, 3, 0))
    
    boxplot(var_name, main = "With Outliers")
    hist(var_name, main = "With Outliers", xlab = NA, ylab = NA)
    
    outlier <- boxplot.stats(var_name)$out
    mo <- mean(outlier)
    
    var_name <- ifelse(var_name %in% outlier, NA, var_name)
    
    boxplot(var_name, main = "Without Outliers")
    hist(var_name, main = "Without Outliers", xlab = NA, ylab = NA)
    
    title("Outlier Check", outer = TRUE)
    
    na2 <- sum(is.na(var_name))
    
    message("Outliers Identified: ", na2 - na1, " from ", tot, " Observations")
    message("Proportion (%) of Outliers: ", round((na2 - na1) / tot * 100), 2, "%")
    message("Mean of the Outliers: ", round(mo, 2))
    
    m2 <- mean(var_name, na.rm = T)
    
    message("Mean without Removing Outliers: ", round(m1, 2))
    message("Mean if Outliers are Removed: ", round(m2, 2))
    
    response <- readline(
        prompt="Do you want to remove outliers and replace with NAs? [y/n]: ")
    
    if (response == "y" | response == "yes") {
        dt[as.character(substitute(var))] <- invisible(var_name)
        assign(as.character(as.list(match.call())$dt), dt, envir = .GlobalEnv)
        message("Outliers successfully removed", "\n")
        
        return(invisible(dt))
        
    } else {
        message("Nothing changed", "\n")
        
        return(invisible(var_name))
    }
}
