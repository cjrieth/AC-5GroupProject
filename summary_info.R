library(tidyverse)
# test
# Data Set 1:
btc_usd <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/BTC-USD-YAHOO.csv",
  stringsAsFactors = F, na.strings = "null"
)


btc_usd <- btc_usd %>% rename(Price = High)

# Data Set 2:
gpus <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/gpu-cpu-history-kaggle/All_GPUs.csv",
  stringsAsFactors = F
)

gpus$Release_Price <- as.numeric(gsub("\\$", "", gpus$Release_Price))
gpus$Release_Date <- gsub("\\\n", "", gpus$Release_Date)
gpus$Release_Date <- as.Date(gpus$Release_Date, format = "%d-%b-%Y")

# Data Set 3:
bitcoin_price <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/bitcoin_price.csv",
  stringsAsFactors = F
)

bitcoin_price <- bitcoin_price %>% rename(Price = High)
bitcoin_price$Date <- as.Date(bitcoin_price$Date, format = "%b %d, %Y")

# Data Set 4:
ethereum_price <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/ethereum_price.csv",
  stringsAsFactors = F
)

ethereum_price <- ethereum_price %>% rename(Price = High)
ethereum_price$Date <- as.Date(ethereum_price$Date, format = "%b %d, %Y")

# Data Set 5:
dash_price <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/dash_price.csv",
  stringsAsFactors = F
)

dash_price <- dash_price %>% rename(Price = High)
dash_price$Date <- as.Date(dash_price$Date, format = "%b %d, %Y")

# Data Set 6:
iota_price <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/iota_price.csv",
  stringsAsFactors = F
)

iota_price <- iota_price %>% rename(Price = High)
iota_price$Date <- as.Date(iota_price$Date, format = "%b %d, %Y")

# Function to get summary information for each data set (excluding GPUs)
get_summary_info <- function(data) {
  summary_info <- list()
  summary_info$features <- colnames(data)
  summary_info$n_cols <- ncol(data)
  summary_info$n_obs <- nrow(data)
  summary_info$max_price <- data %>%
    filter(Price == max(Price, na.rm = T)) %>%
    select(Price)
  summary_info$date_max_price <- data %>%
    filter(Price == max(Price, na.rm = T)) %>%
    select(Date)
  summary_info$start_price <- data %>%
    filter(Date == min(Date, na.rm = T)) %>%
    select(Price)
  summary_info$date_start_price <- data %>%
    filter(Date == min(Date, na.rm = T)) %>%
    select(Date)
  return(summary_info)
}

# Summary info for each data set
btc_summary <- get_summary_info(btc_usd)
bitcoin_summary <- get_summary_info(bitcoin_price)
ethereum_summary <- get_summary_info(ethereum_price)
dash_summary <- get_summary_info(dash_price)
iota_summary <- get_summary_info(iota_price)
gpu_summary <- list()
gpu_summary$n_cols <- ncol(gpus)
gpu_summary$n_obs <- nrow(gpus)
gpu_summary$max_release_price <- gpus %>%
  filter(Release_Price == max(Release_Price, na.rm = T)) %>%
  select(Release_Price)
gpu_summary$max_price_release_date <- gpus %>%
  filter(Release_Price == max(Release_Price, na.rm = T)) %>%
  select(Release_Date)
gpu_summary$model_max_price <- gpus %>%
  filter(Release_Price == max(Release_Price, na.rm = T)) %>%
  select(Architecture)
