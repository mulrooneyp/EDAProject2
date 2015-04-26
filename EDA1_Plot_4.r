setwd("E:/Dropbox/@Coursera/Exploritory Data Analysis/EDA Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#NOTE - I'm assuming coal sources are all thoses sources which 
#       include "coal" in the SCC$SCC.Level.Three description

SCC_Coal <- as.character(SCC$SCC[grep("coal",SCC$SCC.Level.Three,value=FALSE,ignore.case = TRUE)])

NEISample_Coal <- subset(NEI, NEI$SCC %in% SCC_Coal)


NEISample_Coal$year <- as.factor(NEISample_Coal$year)

library(ggplot2)

png(width = 480, height = 480, file = "plot4.png")

ggplot(NEISample_Coal, aes(year,Emissions)) +
  stat_summary(fun.y = sum, geom = "line") +
  xlab("Year") +
  ylab("PM2.5 Emissions (tons)") +
  ggtitle("PM2.5 Coal Emissions Across the United States ")

dev.off()





              
                  
                  
  