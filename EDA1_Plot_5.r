setwd("E:/Dropbox/@Coursera/Exploritory Data Analysis/EDA Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#NOTE I'm assuming motor vehicle sources are those with an NEI$type of "ON-ROAD"
NEISample <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
NEISample$year <- as.factor(NEISample$year)

library(ggplot2)

png(width = 480, height = 480, file = "plot5.png")

ggplot(NEISample, aes(group=1,year,Emissions)) +
  stat_summary(fun.y = sum, geom = "line") +   
  xlab("Year") +
  ylab("PM2.5 Emissions (tons)") +
  ggtitle("PM2.5 Emissions Motor Vehicle Sources in Baltimore ")

dev.off()

