library(dplyr)
library(lintr)
library(shiny)
library(ggplot2)
source("app_server.R")

introduction <-
  
choose_crypto <- selectInput(inputId = "choose_crypto",
                                label = h3("Choose a Cryptocurrency"),
                                choices = "Bitcoin", "Dash", "Ethereum", "Iota")
choose_data <- selectInput("choose_data", label = h3("Choose a Type of Data"),
                           choices = "High", "Low", "Open", "Close", "Volume")  
page_one <- tabPanel(
  "Cryptocurrency Prices During the Pandemic", sidebarLayout(
    sidebarPanel(
      choose_crypto, choose_data),
    mainPanel(
      plotlyOutput("crypto_vs_time"),
      p("blub"),
    )))
  
page_two <-
  
  
page_three <-
  
  
summary <- 
  
  
ui <- navbarPage("Cryptocurrency Analysis", introduction, page_one, page_two, page_three, summary)
