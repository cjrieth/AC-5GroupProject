library(dplyr)
library(lintr)
library(shiny)
library(ggplot2)
library(plotly)

source("app_server.R")

introduction <-

page_one <-

gpu_page <- tabPanel(
    "GPU Releases and Crypto Price",
    sidebarLayout(
      sidebarPanel(
        selectInput(
          inputId = "gpu_crypto",
          label = "Cryptocurrency",
          choices =  c("Bitcoin", "Ethereum", "Dash")
        )
      ),
      mainPanel(
        plotlyOutput(
          outputId = "gpu"
        )
      )
    )
)
  
  
page_three <-
  
  
summary <- 
  
  
ui <- navbarPage("Cryptocurrency Analysis", introduction, page_one, pgu_page, page_three, summary)


