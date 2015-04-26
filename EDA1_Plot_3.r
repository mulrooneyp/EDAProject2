setwd("E:/Dropbox/@Coursera/Exploritory Data Analysis/EDA Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISample <- subset(NEI, NEI$fips == "24510")
NEISample$year <- as.factor(NEISample$year)
NEISample$type <- as.factor(NEISample$type)

library(ggplot2)

png(width = 480, height = 480, file = "plot3.png")

ggplot(NEISample, aes(group=1,year,Emissions)) +
  stat_summary(fun.y = sum, geom= "line") +
  facet_grid(.~type) +
  xlab("Year") + 
  ylab("PM2.5 Emissions (tons)") +
  ggtitle("PM2.5 Emissions for Baltimore by source type")

dev.off()