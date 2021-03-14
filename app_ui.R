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
          outputId = "gpu",
          HTML("<br/>"),
          p("This chart is meant to explore how new releases of Graphical Processing Units, or GPUs, might affect the price of a cryptocurrency.
          Crytpto is created by mining it with a computer, so the more computing power you have the more bitcoin you can gain. 
          This means that crypto miners are always quick to pick up the latest and greatest GPUs on the market, as they are more powerful than older versions and therefore better at mining crypto. 
          There may be some correlation between the release of a new GPU and the price of a crypto  upon its release.")
        )
      )
    )
)
  
  
page_three <-
  
  
summary <- 
  
  
ui <- navbarPage("Cryptocurrency Analysis", introduction, page_one, pgu_page, page_three, summary)


