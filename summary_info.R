library(tidyverse)

# Data Set 1:
BTC_USD <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/BTC-USD-YAHOO.csv",
                    stringsAsFactors = F)

BTC_USD <- BTC_USD %>% rename(Price = High)

# Data Set 2:
GPUs <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/gpu-cpu-history-kaggle/All_GPUs.csv",
                 stringsAsFactors = F)

GPUs <- GPUs %>% rename(Date = Release_Date, Price = Release_Price)
# having trouble formatting dates for GPUs data set also data set is out of date 

# Data Set 3:
bitcoin_price <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/bitcoin_price.csv",
                          stringsAsFactors = F)

bitcoin_price <- bitcoin_price %>% rename(Price = High)
bitcoin_price$Date <- as.Date(bitcoin_price$Date, format = "%b %d, %Y")

# Data Set 4: 
ethereum_price <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/ethereum_price.csv",
                           stringsAsFactors = F)

ethereum_price <- ethereum_price %>% rename(Price = High)
ethereum_price$Date <- as.Date(ethereum_price$Date, format = "%b %d, %Y")
  
# Data Set 5:
dash_price <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/dash_price.csv",
                       stringsAsFactors = F)

dash_price <- dash_price %>% rename(Price = High)
dash_price$Date <- as.Date(dash_price$Date, format = "%b %d, %Y")
  
# Data Set 6:
iota_price <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/iota_price.csv",
                       stringsAsFactors = F)

iota_price <- iota_price %>% rename(Price = High)
iota_price$Date <- as.Date(iota_price$Date, format = "%b %d, %Y")

# Function to get summary information for each data set 
get_summary_info <- function(data) {
  summary_info <- list()
  summary_info$features <- colnames(data)
  summary_info$n_obs <- nrows(data)
  summary_info$max_price <- 
  
  summary_info$date_max_price <- 
    
  summary_info$start_price <- 
    
  summary_info$date_start_price <- 
    
  return(summary_info)
}
