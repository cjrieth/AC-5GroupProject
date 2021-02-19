"Use this file to start making your individual aggregate tables!"
library(tidyr)
library(dplyr)
library(ggplot2)
library(stringr)

gpus <- read.csv("~/Desktop/Info201/AC-5GroupProject/data/gpu-cpu-history-kaggle/All_GPUs.csv")
btc <- read.csv("~/Desktop/Info201/AC-5GroupProject/data/BTC-USD-5Y.csv", na.strings = c("null"))
  
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
         "Oct"= "10",
         "Nov"= "11",
         "Dec"= "12")
  return(paste(str_trim(split[[1]][[3]]), num, str_trim(split[[1]][[1]]), sep = "-"))
}

gpus_f <- gpus %>%
  filter(!str_detect(Release_Date, "Unknown Release Date")) %>%
  rowwise() %>%
  mutate(Date = convert_date(Release_Date)) %>%
  group_by(Date) %>%
  count() %>%
  rename(num_gpus_released = n)

btc <- btc %>%
  group_by(Date) %>%
  select(Date, Close)

joined <- left_join(btc, gpus_f, by = "Date")

joined <- joined %>%
  mutate(Date = as.Date(Date, "%Y-%m-%d")) %>%
  arrange(Date)
