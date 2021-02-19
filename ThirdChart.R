library(tidyverse)
library(ggplot2)
library(gridExtra)
bitcoin <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/BTC-USD.csv", na.strings = c("null"))
dash <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/DASH-USD.csv", na.strings = c("null"))
ethereum <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/ETH-USD.csv", na.strings = c("null"))
iota <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/MIOTA-USD.csv", na.strings = c("null"))

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

ggplot(data = everything) + 
  geom_point(mapping = aes(x = Date, y = bithigh))
  
  
  # labs(title = "Bitcoin High Prices Over Time", x = "Date", y = "Price") + 
  # scale_x_date(scale_x_date(
  #   name = waiver(),
  #   breaks = waiver(),
  #   date_breaks = waiver(),
  #   labels = waiver(),
  #   date_labels = waiver(),
  #   minor_breaks = waiver(),
  #   date_minor_breaks = waiver(),
  #   limits = NULL,
  #   expand = waiver(),
  #   guide = waiver(),
  #   position = "bottom",
  #   sec.axis = waiver())) + 
  # scale_y_discrete()

dashgraph <- ggplot(data = everything, aes(Date, dashhigh)) +
  geom_line(color = "red",size = .3) +
  geom_point(color="red") +
  labs(title = "Dash High Prices Over Time", x = "Date", y = "Price")

ethereumgraph <- ggplot(data = everything, aes(Date, ethhigh)) +
  geom_line(color = "purple",size = .3) +
  geom_point(color="purple") +
  labs(title = "Ethereum High Prices Over Time", x = "Date", y = "Price")

iotagraph <- ggplot(data = everything, aes(Date, iotahigh)) +
  geom_line(color = "green",size = .3) +
  geom_point(color="green") +
  labs(title = "Iota High Prices Over Time", x = "Date", y = "Price") 

grid.arrange(bitcoingraph, dashgraph, ethereumgraph, iotagraph)




