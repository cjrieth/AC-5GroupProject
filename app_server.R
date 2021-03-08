library(ggplot2)
library(dplyr)
library(lintr)
library(shiny)
bitcoin <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/BTC-USD.csv", na.strings = c("null"))
dash <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/DASH-USD.csv", na.strings = c("null"))
ethereum <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/ETH-USD3YR.csv", na.strings = c("null"))
iota <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/MIOTA-USD.csv", na.strings = c("null"))

bitcoin_prices <- bitcoin %>%
  mutate(bithigh = High) %>%
  mutate(bitlow = Low) %>%
  mutate(bitopen = Open) %>%
  mutate(bitclose = Close) %>%
  mutate(bitvol = Volume) %>%
  mutate(Date = as.Date(Date)) %>%
  group_by(Date) %>%
  select(Date, bithigh, bitlow, bitopen, bitclose, bitvol)

dash_prices <- dash %>%
  mutate(dashhigh = High) %>%
  mutate(dashlow = Low) %>%
  mutate(dashopen = Open) %>%
  mutate(dashclose = Close) %>%
  mutate(dashvol = Volume) %>%
  mutate(Date = as.Date(Date)) %>%
  group_by(Date) %>%
  select(Date, dashhigh, dashlow, dashopen, dashclose, dashvol)

ethereum_prices <- ethereum %>%
  mutate(ethhigh = High) %>%
  mutate(ethlow = Low) %>%
  mutate(ethopen = Open) %>%
  mutate(ethclose = Close) %>%
  mutate(ethvol = Volume) %>%
  mutate(Date = as.Date(Date)) %>%
  group_by(Date) %>%
  select(Date, ethhigh, ethlow, ethopen, ethclose, ethvol)

iota_prices <- iota %>%
  mutate(iotahigh = High) %>%
  mutate(iotalow = Low) %>%
  mutate(iotaopen = Open) %>%
  mutate(iotaclose = Close) %>%
  mutate(iotavol = Volume) %>%
  mutate(Date = as.Date(Date)) %>%
  group_by(Date) %>%
  select(Date, iotahigh, iotalow, iotaopen, iotaclose, iotavol)

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






server <- function(input, output) {
  output$crypto_vs_time <- renderPlotly({
    plot <- everything %>%
      filter(crypto == input$choose_crypto) %>%
      filter(type_data == input$choose_data)
    ggplot(plot) +
      geom_point(mapping = aes(x =  Date, y = )) +
      labs(title = "Something", 
           x = "blub", y = "bleh")
  })
  output$oil_v_time <- renderPlotly({
    plot <- data %>%
      filter(country == input$) %>%

    ggplot(plot) +
      geom_point(mapping = aes(x =  year, y = )) +
      labs(title = "Something", 
           x = "blub", y = "bleh")
  })
}
