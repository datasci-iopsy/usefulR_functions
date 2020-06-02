#For publishing to DataScience+ via RMarkdown
# https://datascienceplus.com/posting-from-r-markdown-to-datascienceplus/

install.packages("devtools")
library(devtools)

install_github("duncantl/XMLRPC")
install_github("duncantl/RWordPress")
install.packages("knitr")

library(XMLRPC)
library(RWordPress)
library(knitr)

if (!require('RWordPress')) {
    install.packages("devtools")
    devtools::install_github(c("duncantl/XMLRPC", "duncantl/RWordPress"))
}

opts_knit$set(upload.fun = function(file){uploadFile(file)$url})
options(
    WordpressLogin = c(username = "password"), 
    WordpressURL = "https://datascienceplus.com/xmlrpc.php"
)
knit2wp("your_rmarkdown_file.Rmd", 
        title = "The Post Title", 
        publish = FALSE)