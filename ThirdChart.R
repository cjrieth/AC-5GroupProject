library(tidyverse)
library(GGally)
bitcoin <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/BTC-USD.csv")
dash <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/DASH-USD.csv")
ethereum <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/ETH-USD.csv")
iota <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/MIOTA-USD.csv")

bitcoin_prices <- bitcoin %>%
  mutate(bithigh = High) %>%
  group_by(Date) %>%
  select(Date, bithigh)

dash_prices <- dash %>%
  mutate(dashhigh = High) %>%
  group_by(Date) %>%
  select(Date, dashhigh)

ethereum_prices <- ethereum %>%
  mutate(ethhigh = High) %>%
  group_by(Date) %>%
  select(Date, ethhigh)

iota_prices <- iota %>%
  mutate(iotahigh = High) %>%
  group_by(Date) %>%
  select(Date, iotahigh)

bitdash <- left_join(bitcoin_prices, dash_prices)
bitdasheth <- left_join(bitdash, ethereum_prices)
everything <- left_join(bitdasheth, iota_prices)

ggplot(data = everything, aes(Date, bithigh)) +
  geom_line(color = "blue",size = .3) +
  geom_point(color="blue") +
  labs(title = "Bitcoin High Prices Over Time", x = "Date", y = "Price")


ggplot(data = everything, aes(Date, dashhigh)) +
  geom_line(color = "red",size = .3) +
  geom_point(color="red") +
  labs(title = "Dash High Prices Over Time", x = "Date", y = "Price")

ggplot(data = everything, aes(Date, ethhigh)) +
  geom_line(color = "purple",size = .3) +
  geom_point(color="purple") +
  labs(title = "Ethereum High Prices Over Time", x = "Date", y = "Price")

ggplot(data = everything, aes(Date, iotahigh)) +
  geom_line(color = "green",size = .3) +
  geom_point(color="green") +
  labs(title = "Iota High Prices Over Time", x = "Date", y = "Price") + 
  scale_x_continuous(breaks = seq(by = 12)) +
  scale_y_continuous(breaks = seq(len = 10000))





