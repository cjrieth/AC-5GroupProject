# Bitcoin Trading From 2018 by day of the week

##Pulls in the main data set for bitcoin since Jan 1, 2018
bitcoin <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/BTC-USD3YR.csv")
ethereum <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/ETH-USD3YR.csv")

##Stores the column that is number of shares traded for each day
btcvolume <- data.frame(as.numeric(bitcoin$Volume))
ethvolume <- data.frame(as.numeric(ethereum$Volume))

##Stores the data for each of the days of the week in a variable
btcmon <- btcvolume[seq(1, nrow(btcvolume), 7), ]
btctues <- btcvolume[seq(2, nrow(btcvolume), 7), ]
btcwed <- btcvolume[seq(3, nrow(btcvolume), 7), ]
btcthur <- btcvolume[seq(4, nrow(btcvolume), 7), ]
btcfri <- btcvolume[seq(5, nrow(btcvolume), 7), ]
btcsat <- btcvolume[seq(6, nrow(btcvolume), 7), ]
btcsun <- btcvolume[seq(7, nrow(btcvolume), 7), ]
ethmon <- ethvolume[seq(1, nrow(ethvolume), 7), ]
ethtues <- ethvolume[seq(2, nrow(ethvolume), 7), ]
ethwed <- ethvolume[seq(3, nrow(ethvolume), 7), ]
eththur <- ethvolume[seq(4, nrow(ethvolume), 7), ]
ethfri <- ethvolume[seq(5, nrow(ethvolume), 7), ]
ethsat <- ethvolume[seq(6, nrow(ethvolume), 7), ]
ethsun <- ethvolume[seq(7, nrow(ethvolume), 7), ]

##Changes the data into a data frame instead of a value
btcmon <- as.data.frame(btcmon)
btctues <- as.data.frame(btctues)
btcwed <- as.data.frame(btcwed)
btcthur <- as.data.frame(btcthur)
btcfri <- as.data.frame(btcfri)
btcsat <- as.data.frame(btcsat)
btcsun <- as.data.frame(btcsun)
ethmon <- as.data.frame(ethmon)
ethtues <- as.data.frame(ethtues)
ethwed <- as.data.frame(ethwed)
eththur <- as.data.frame(eththur)
ethfri <- as.data.frame(ethfri)
ethsat <- as.data.frame(ethsat)
ethsun <- as.data.frame(ethsun)

##Adds all values to store total shares traded for each day of the week
btcmonf <- sum(btcmon, na.rm = TRUE)
btctuesf <- sum(btctues, na.rm = TRUE)
btcwedf <- sum(btcwed, na.rm = TRUE)
btcthurf <- sum(btcthur, na.rm = TRUE)
btcfrif <- sum(btcfri, na.rm = TRUE)
btcsatf <- sum(btcsat, na.rm = TRUE)
btcsunf <- sum(btcsun, na.rm = TRUE)
ethmonf <- sum(ethmon, na.rm = TRUE)
ethtuesf <- sum(ethtues, na.rm = TRUE)
ethwedf <- sum(ethwed, na.rm = TRUE)
eththurf <- sum(eththur, na.rm = TRUE)
ethfrif <- sum(ethfri, na.rm = TRUE)
ethsatf <- sum(ethsat, na.rm = TRUE)
ethsunf <- sum(ethsun, na.rm = TRUE)

##Creates bargraph of data
btcbar <- c(btcmonf/10000000000, btctuesf/10000000000, btcwedf/10000000000,
            btcthurf/10000000000, btcfrif/10000000000, btcsatf/10000000000, 
            btcsunf/10000000000)
ethbar <- c(ethmonf/10000000000, ethtuesf/10000000000, ethwedf/10000000000,
            eththurf/10000000000, ethfrif/10000000000, ethsatf/10000000000, 
            ethsunf/10000000000)
bardatafinal <- data.frame(btcbar, ethbar)
secondchart <- barplot(btcbar,
main = "Bitcoin Trading by Day of the Week From 2018",
ylab = "Number of Shares Traded",
names.arg = c("Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun"),
col = "purple",
border = "yellow")













