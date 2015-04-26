setwd("E:/Dropbox/@Coursera/Exploritory Data Analysis/EDA Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(plyr)

NEISum = tapply(NEI$Emissions,as.factor(NEI$year),sum)

png(width = 480, height = 480, file = "plot1.png")

barplot(NEISum/1000000,xlab = "Year", ylab = "PM2.5 Emissions (million tons)", 
        main = "total emissions from PM2.5 in US")

dev.off()

