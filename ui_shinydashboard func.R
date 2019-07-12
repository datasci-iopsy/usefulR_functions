rm(list = ls()) #clean environment

library(shiny)
library(shinydashboard)

shinyUI(
     dashboardPage(
          dashboardHeader(),
          dashboardSidebar(), 
          dashboardBody()
     )
)