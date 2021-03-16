# Import packages
library(dplyr)
library(ggplot2)
library(shiny)
library(plotly)
library(stringr)

# Source ui and server files
source("app_ui.R")
source("app_server.R")

# Create shiny app
shinyApp(ui = ui, server = server)
