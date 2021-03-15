library(dplyr)
library(lintr)
library(shiny)
library(ggplot2)
library(plotly)

source("app_server.R")

introduction <-
  
choose_crypto <- selectInput(inputId = "choose_crypto",
                                label = h3("Choose a Cryptocurrency"),
                                choices = "Bitcoin", "Dash", "Ethereum", "Iota")
# choose_data <- selectInput("choose_data", label = h3("Choose a Type of Data"),
#                            choices = "High", "Low", "Open", "Close", "Volume")  
page_one <- tabPanel(
  "Cryptocurrency Prices During the Pandemic", sidebarLayout(
    sidebarPanel(
      choose_crypto), #, choose_data),
    mainPanel(
      plotlyOutput("crypto_vs_time"),
      p("blub"),
    )))

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


