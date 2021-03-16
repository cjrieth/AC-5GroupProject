# User interface 

# Introduction page 
intro_panel <- tabPanel(
  "Purpose",
  tags$head(
    # Note the wrapping of the string in HTML()
    tags$style(HTML("
    body{
      background-image: url('data:image/png;base64,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');
    }
      .shiny-input-container {
        color: #474747;
      }
      p {
        background-color: white;  
      }
      h1{
        background-color: white;  
      }"))
  ),
  h1("Cryptocurrency:", em("What"), " is it and ", em("Why"), " it matters?"), 
  p(
    "Cryptocurrency is a decentralized, virtual medium of exchange
    that has become very popular over a rather short period of time.
    It relies on the participation of users in the blockchain network.
    These users, or rather their computers, solve complicated mathematical
    algorithms in order to validate blocks to acquire a fraction of a crypto
    coin. Due to the security provided by validating transactions and using
    a sequential blockchain, this quickly evolving type of currency could
    guide financial markets in the future. Thus it is becoming increasingly more 
    important to analyze and understand the behvior of cryptocurrencies. Originally 
    cryptocurrency, namely Bitcoin, was heavily used in black market transactions 
    due to the difficulty of tracing it back to an individual user. It is intriguing
    that it was started by computer scientists and was quickly manipulated by black 
    market actors. There is also a huge influx of younger people between the ages of
    16 and 25 that are investing their money in cryptocurrency. This has helped
    fuel Bitcoin and spark the creation of so many other cryptocurrencies.
    Recently the sharp rise in the price of Bitcoin has only furthered the
    intrigue surrounding crypto, however many still believe it has not reached
    its full potential yet."
  ),
  h1("Aims of Exploration"),
  tags$p(
    "Analyzing past trends and external factors that impact the behavior of crypto
    currency may allow us to better predict the performance and prominence of crypto
    in the future. This exploratory prjoect aims to answer three major questions."
    ),
  tags$ol(
    tags$li(strong("How have crypto prices changed over COVID lockdown periods?")),
    tags$li(strong("How do new releases of GPUs and CPUs affect the price of crypto?")),
    tags$li(strong("Which day of the week is the most crypto bought and sold?"))
  ),
  p(
   "The hype surrounding cryptocurrencies has increased rather dramatically in the midst
   of the COVID pandemic. More people are stuck at home with more free time to spend on
   activities that can be done in isolation, such as taking an interest in the financial
   market and trading stock. Thus we thought it would be interesting to track the prices
   of four different crypto currencies since the start of the pandemic in an attempt to
   answer the first question. Moreover, it is a known fact that the price of cryptocurrencies
   is linked to the price of computer hardware such as graphical processing units so anlaysis
   between their respective prices may help to deduce the impact of new hardware on the price
   of crypto. Lastly, we wanted to gain some insight into the behavior of the people 
   participating in the cryptocurency market. As previously mentioned there has been a 
   large surge in the number of young adults participating in crypto investment and trading.
   One could hypothesize that, because of this, crypto is traded more frequently on the
   weekends as a more whimsical activity."
    ),
  h1("Relevant Data Sets"),
  p(
    "This project draws on six different data sets. Five of the data sets represent
    financial information and are thus similar in nature. The other data set consists
    of various information associated with different models of graphical processing units.
    To gain a better understanding and appreciation of each data set we found summary values
    that are of interest to us as creators. The data sets are breifly described below."
    ),
  p(
    a("Bitcoin Prices (Yahoo Finance)",
    href = "https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/BTC-USD-YAHOO.csv"),
    "has 7 features with the following names: Date, Open, Price, Low, Close, Adj.Close,
    Volume. It also has 367 individual observations. This data tells us that the price of Bitcoin
    started at $9,521.7 on January 31, 2020."
    ),
  p(
    a("Bitcoin Prices (Kaggle)",
      href = "https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/bitcoin_price.csv"),
    "has 7 features with the following names: Date, Open, Price, Low, Close, Volume, Market.Cap.
    It also has 1760 individual observations. The data tells us that the price of Bitcoin started at $136.0 on 
    pril 28, 2013."
    ),
  p(
    a("Ethereum Prices",
      href = "https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/ethereum_price.csv"),
    "has 7 features with the following names: Date, Open, Price, Low, Close, Volume, Market.Cap.
    It also has 929 individual observations. The data tells us that the price of Ethereum started at $3.5 on
    August 07, 2015."
    ),
  p(
    a("Dash Prices",
      href = "https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/iota_price.csv"),
    "has 7 features with the following names: Date, Open, Price, Low, Close, Volume, Market.Cap.
    It also has 1468 individual observations. The data tells us that the price of Dash started at $0.4 on
    February 14, 2014."
    ),
  p(
    a("Iota Prices",
      href = "https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/iota_price.csv"),
    "has 7 features with the following names: Date, Open, Price, Low, Close, Volume, Market.Cap.
    It also has 253 individual observations. The data tells us that the price of Iota started at $0.7 on June
    13, 2017"
    ),
  p(
    a("GPU Releases",
      href = "https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/gpu-cpu-history-kaggle/All_GPUs.csv"),
    "contains information outside the scope of this report. It has 34 features and 3406 individual
    observations. Information we found pertinent is as follows. The highest price of a GPU unpon its release date
    was for the model Fermi GF100 (x2) , released at a price of $14,999.0 on July 25, 2011."
  )
)

# GPU and crypto prices page 
gpu_page <- tabPanel(
    "GPU Releases and Crypto Price",
    sidebarLayout(
      sidebarPanel(
        selectInput(
          inputId = "gpu_crypto",
          label = h3("Choose a Cryptocurrency"),
          choices =  c("Bitcoin", "Ethereum", "Dash")
        )
      ),
      mainPanel(
        plotlyOutput(outputId = "gpu"),
        p("This chart is meant to explore how new releases of Graphical Processing
          Units, or GPUs, might affect the price of a cryptocurrency. Hover over
          the points on the graph to see which GPU was released on that day.")
      )
    )
)

# Crypto during the pandemic page 
page_one <- tabPanel(
  "Cryptocurrency Prices During the Pandemic", sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "choose_crypto",
                  label = h3("Choose a Cryptocurrency"),
                  choices = c("Bitcoin", "Dash", "Ethereum", "Iota")), 
      selectInput("choose_data", label = h3("Choose a Type of Data"),
                  choices = c("High", "Low", "Open", "Close", "Volume"))),
    mainPanel(
      plotlyOutput("crypto_vs_time"),
      p("This chart explores the data from four different cryptocurrencies: Bitcoin,
        Dash, Ethereum, and Iota. The user can choose to see how the high, low, open,
        close, and volume prices differ over this past year during the pandemic and how 
        the prices have changed due to quarantining."),
    )))

# Widget for trading by day 
btc_or_eth <- selectInput(inputId = "btc_or_eth",
                          label = h3("Choose a Cryptocurrency"),
                          choices = c("Bitcoin" = "btcbar", "Ethereum" = "ethbar"))  

# Trading by day of the week page 
page_three <- tabPanel(
  "Trading by Day", sidebarLayout(
    sidebarPanel(
      btc_or_eth
    ), 
    mainPanel(
      plotlyOutput(
        outputId = "weekday"),
        p("This chart shows the average number of crypto shares that are traded
          on each days of the week in 2018. The user can choose between Bitcoin
          and Ethereum and see a comparison of shares being traded on each day
          of the week.")
    )
  )
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


