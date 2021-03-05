library(tidyverse)
library(ggplot2)
library(gridExtra)
library(lintr)
#omnom
lintr::lint("ThirdChart.R")
bitcoin <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/BTC-USD.csv", na.strings = c("null"))
dash <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/DASH-USD.csv", na.strings = c("null"))
ethereum <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/ETH-USD3YR.csv", na.strings = c("null"))
iota <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/MIOTA-USD.csv", na.strings = c("null"))

bitcoin_prices <- bitcoin %>%
  mutate(bithigh = High) %>%
  mutate(Date = as.Date(Date)) %>%
  group_by(Date) %>%
  select(Date, bithigh)

dash_prices <- dash %>%
  mutate(dashhigh = High) %>%
  mutate(Date = as.Date(Date)) %>%
  group_by(Date) %>%
  select(Date, dashhigh)

ethereum_prices <- ethereum %>%
  mutate(ethhigh = High) %>%
  mutate(Date = as.Date(Date)) %>%
  group_by(Date) %>%
  select(Date, ethhigh)

iota_prices <- iota %>%
  mutate(iotahigh = High) %>%
  mutate(Date = as.Date(Date)) %>%
  group_by(Date) %>%
  select(Date, iotahigh)

bitdash <- left_join(bitcoin_prices, dash_prices)
bitdasheth <- left_join(bitdash, ethereum_prices)
everything <- left_join(bitdasheth, iota_prices)

bitcoingraph <- ggplot(data = everything) + 
  geom_point(mapping = aes(x = Date, y = bithigh)) + 
  labs(title = "Bitcoin High Prices Over Time", x = "Date", y = "Price", size = .1)

dashgraph <- ggplot(data = everything, aes(Date, dashhigh)) +
  geom_point(color = "red") +
  labs(title = "Dash High Prices Over Time", x = "Date", y = "Price")

ethereumgraph <- ggplot(data = everything, aes(Date, ethhigh)) +
  geom_point(color = "purple") +
  labs(title = "Ethereum High Prices Over Time", x = "Date", y = "Price")

iotagraph <- ggplot(data = everything, aes(Date, iotahigh)) +
  geom_point(color = "green") +
  labs(title = "Iota High Prices Over Time", x = "Date", y = "Price") 

third_chart <- grid.arrange(bitcoingraph, dashgraph, ethereumgraph, iotagraph)




