library(tidyverse)
library(GGally)
bitcoin <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/bitcoin_price.csv")
dash <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/dash_price.csv")
ethereum <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/ethereum_price.csv")
iota <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/kaggle_crypto_data/iota_price.csv")

bitcoin_prices <- bitcoin %>%
  mutate(bithigh = sum(High)) %>%
  mutate(bitlow = sum(Low)) %>%
  group_by(Date) %>%
  select(Date, bithigh, bitlow)

dash_prices <- dash %>%
  mutate(dashhigh = sum(High)) %>%
  mutate(dashlow = sum(Low)) %>%
  group_by(Date) %>%
  select(Date, dashhigh, dashlow)

ethereum_prices <- ethereum %>%
  mutate(ethhigh = sum(High)) %>%
  mutate(ethlow = sum(Low)) %>%
  group_by(Date) %>%
  select(Date, ethhigh, ethlow)

iota_prices <- iota %>%
  mutate(iotahigh = sum(High)) %>%
  mutate(iotalow = sum(Low)) %>%
  group_by(Date) %>%
  select(Date, iotahigh, iotalow)

everything <- left_join(bitcoin_prices, dash_prices, ethereum_prices, iota_prices)

ggplot(data = bitcoin, aes(Date, High, Low)) +
  geom_line(color = "blue",size = .3) +
  geom_point(color="blue") +
  labs(title = "Bitcoin High Prices Over Time")

ggplot(data = dash, aes(Date, High, Low)) +
  geom_line(color = "red",size = .3) +
  geom_point(color="red") +
  labs(title = "Dash High Prices Over Time")

ggplot(data = ethereum, aes(Date, High, Low)) +
  geom_line(color = "purple",size = .3) +
  geom_point(color="purple") +
  labs(title = "Ethereum High Prices Over Time")

ggplot(data = iota, aes(Date, High)) +
  geom_line(color = "green",size = .3) +
  geom_point(color="green") +
  labs(title = "Iota High Prices Over Time")





