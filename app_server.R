# Server 
library(ggplot2)
library(dplyr)
library(lintr)
library(shiny)
library(stringr)
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


# Define server 
server <- function(input, output) {
  output$crypto_vs_time <- renderPlotly({
    plot <- everything %>%
      select(switch(input$choose_data, "High" = switch(input$choose_crypto, "Bitcoin" = bithigh, "Ethereum" = ethhigh, "Dash" = dashhigh, "Iota" = iotahigh),
                    "Low" = switch(input$choose_crypto, "Bitcoin" = bitlow, "Ethereum" = ethlow, "Dash" = dashlow, "Iota" = iotalow),
                    "Open" = switch(input$choose_crypto, "Bitcoin" = bitopen, "Ethereum" = ethopen, "Dash" = dashopen, "Iota" = iotaopen),
                    "Close" = switch(input$choose_crypto, "Bitcoin" = bitclose, "Ethereum" = ethclose, "Dash" = dashclose, "Iota" = iotaclose),
                    "Volume" = switch(input$choose_crypto, "Bitcoin" = bitvol, "Ethereum" = ethvol, "Dash" = dashvol, "Iota" = iotavol),
      ))
    ggplot(plot) +
        if (length(input$choose_data) == 0) return(everything)
        everything %>% dplyr::select(!!!input$choose_data)
      }, rownames = TRUE)
      geom_point(mapping = aes(x =  Date, y = )) +
      labs(title = "Something", 
           x = "blub", y = "bleh")
  })
  output$gpu <- renderPlotly({
    gpus <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/gpu-cpu-history-kaggle/All_GPUs.csv", na.strings = c(""))
    btc <- read.csv(paste0("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/", switch(input$gpu_crypto, "Bitcoin" = "BTC-USD-5Y.csv", "Ethereum" = "ETH-USD-MAX.csv", "Dash" = "DASH-USD-MAX.csv")), na.strings = c("null"))
    
    convert_date <- function(date) {
      split <- str_split(date, "-")
      num <- switch(split[[1]][[2]],
                    "Jan" = "01",
                    "Feb" = "02",
                    "Mar" = "03",
                    "Apr" = "04",
                    "May" = "05",
                    "Jun" = "06",
                    "Jul" = "07",
                    "Aug" = "08",
                    "Sep" = "09",
                    "Oct" = "10",
                    "Nov" = "11",
                    "Dec" = "12")
      return(paste(str_trim(split[[1]][[3]]), num, str_trim(split[[1]][[1]]), sep = "-"))
    }
    
    gpus_f <- gpus %>%
      filter(!str_detect(Release_Date, "Unknown Release Date")) %>%
      rowwise() %>%
      mutate(Date = convert_date(Release_Date)) %>%
      filter(!is.na(Release_Price)) %>%
      group_by(Date) %>%
      arrange(desc(Release_Price)) %>%
      slice_head() %>%
      select(Date, Release_Price, Name)
    
    btc <- btc %>%
      group_by(Date) %>%
      select(Date, Close)
    
    joined <- left_join(btc, gpus_f, by = "Date")
    
    joined <- joined %>%
      mutate(Date = as.Date(Date, "%Y-%m-%d")) %>%
      arrange(Date)
    
    released <- joined %>%
      filter(!is.na(Release_Price))
    
    gpu_btc_plot <- ggplot(joined, aes(x = Date, y = Close)) +
      geom_line() +
      geom_point(data = released, aes(colour = factor(released$Name), text = paste0("GPU Name: ", released$Name))) +
      xlim(as.Date("2016-01-01", "%Y-%m-%d"), as.Date("2016-12-31", "%Y-%m-%d")) +
      ylim(0, 1000) +
      labs(color = "New GPU Released", y = "Close Price (USD)", title = paste0("Overlay of New GPU Releases with ", input$gpu_crypto, " Price"))
    converted <- ggplotly(gpu_btc_plot, tooltip = "text")
    converted
  })
}
