# Bitcoin Trading From 2018 by day of the week

##Pulls in the main data set for bitcoin since Jan 1, 2018
bitcoin <- read.csv("https://raw.githubusercontent.com/cjrieth/AC-5GroupProject/main/data/BTC-USD3YR.csv")

##Stores the column that is number of shares traded for each day
btcvolume <- data.frame(bitcoin$Volume)

##Stores the data for each of the days of the week in a variable
btcmon <- btcvolume[seq(1, nrow(btcvolume), 7), ]
btctues <- btcvolume[seq(2, nrow(btcvolume), 7), ]
btcwed <- btcvolume[seq(3, nrow(btcvolume), 7), ]
btcthur <- btcvolume[seq(4, nrow(btcvolume), 7), ]
btcfri <- btcvolume[seq(5, nrow(btcvolume), 7), ]
btcsat <- btcvolume[seq(6, nrow(btcvolume), 7), ]
btcsun <- btcvolume[seq(7, nrow(btcvolume), 7), ]

##Changes the data into a data frame instead of a value
btcmon <- read.table(text = btcmon)
btctues <- read.table(text = btctues)
btcwed <- read.table(text = btcwed)
btcthur <- read.table(text = btcthur)
btcfri <- read.table(text = btcfri)
btcsat <- read.table(text = btcsat)
btcsun <- read.table(text = btcsun)

##Changes all the characters into numeric values
btcmon$V1 <- as.numeric(as.character(btcmon$V1))
btctues$V1 <- as.numeric(as.character(btctues$V1))
btcwed$V1 <- as.numeric(as.character(btcwed$V1))
btcthur$V1 <- as.numeric(as.character(btcthur$V1))
btcfri$V1 <- as.numeric(as.character(btcfri$V1))
btcsat$V1 <- as.numeric(as.character(btcsat$V1))
btcsun$V1 <- as.numeric(as.character(btcsun$V1))

##Adds all values to store total shares traded for each day of the week
btcmonf <- sum(btcmon$V1, na.rm = TRUE)
btctuesf <- sum(btctues$V1, na.rm = TRUE)
btcwedf <- sum(btcwed$V1, na.rm = TRUE)
btcthurf <- sum(btcthur$V1, na.rm = TRUE)
btcfrif <- sum(btcfri$V1, na.rm = TRUE)
btcsatf <- sum(btcsat$V1, na.rm = TRUE)
btcsunf <- sum(btcsun$V1, na.rm = TRUE)

##Creates bargraph of data
btcbar <- c(btcmonf/10000000000, btctuesf/10000000000, btcwedf/10000000000,
            btcthurf/10000000000, btcfrif/10000000000, btcsatf/10000000000, 
            btcsunf/10000000000)
secondchart <- barplot(btcbar,
main = "Bitcoin Trading by Day of the Week From 2018",
ylab = "Number of Shares Traded",
names.arg = c("Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun"),
col = "purple",
border = "yellow")













