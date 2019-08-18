#this function is to ensure both warning messages and package startup messages
#specifically are removed

shhh = function(...){
    suppressWarnings(
        suppressPackageStartupMessages(base::library(...))
    )
}

#instead of library use "shhh" to call packages now!