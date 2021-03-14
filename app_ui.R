# User interface 
library(dplyr)
library(lintr)
library(shiny)
library(ggplot2)
library(plotly)
source("app_server.R")
# Introduction page 
intro_panel <- tabPanel(
  "Purpose",
  h1("Cryptocurrency:", em("What"), " is it and ", em("Why"), " it matters?"), 
  img(src = 'bitcoin_image.jpg'), 
  p(
    "Cryptocurrency is a decentralized, virtual medium of exchange
    that has become very popular over a rather short period of time.
    It relies on the participation of users in the blockchain network.
    These users, or rather their computers, solve complicated mathematical
    algorithms in order to validate blocks to acquire some share of a crypto
    coin. Due to the security provided by validating transactions and using
    a sequential blockchain, this quickly evolving type of currency could
    guide financial markets in the future. Originally cryptocurrency, namely
    Bitcoin, was heavily used in black market transactions due to the difficulty
    of tracing it back to an individual user. It is intriguing that it was 
    started by computer scientists and was quickly manipulated by black market
    actors. There is also a huge influx of younger people between the ages of 16
    and 25 that are investing their money in cryptocurrency. This has helped
    fuel Bitcoin and spark the creation of so many other cryptocurrencies.
    Recently the sharp rise in the price of Bitcoin has only furthered the
    intrigue surrounding crypto, however many still believe tt has not reached
    its full potential yet. Analyzing past trends and external factors may
    allow us to predict the behavior of crypto. Moreover, the price of
    cryptocurrencies is linked to the price of computer hardware such as
    graphical processing units so anlaysis may also help to deduce the impact
    of new hardware on the price of crypto."
  )
)

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
          p("This chart is meant to explore how new releases of Graphical Processing Units, or GPUs, might affect the price of a cryptocurrency.
          Crytpto is created by mining it with a computer, so the more computing power you have the more bitcoin you can gain. 
          This means that crypto miners are always quick to pick up the latest and greatest GPUs on the market, as they are more powerful than older versions and therefore better at mining crypto. 
          There may be some correlation between the release of a new GPU and the price of a crypto  upon its release.")
        )
      )
    )
)
  
  
page_three <-
  
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
  
page_three <- tabPanel(
  "Trading by Day"
)
  
summary <- tabPanel(
  "Conclusions"
)

ui <- navbarPage("Cryptocurrency Analysis",
                 intro_panel,
                 page_one,
                 gpu_page,
                 page_three,
                 summary
                 )


