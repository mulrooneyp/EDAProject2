setwd("E:/Dropbox/@Coursera/Exploritory Data Analysis/EDA Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIMaryland <- subset(NEI, NEI$fips == "24510")
NEIMarylandSum = tapply(NEIMaryland$Emissions,as.factor(NEIMaryland$year),sum)

png(width = 480, height = 480, file = "plot2.png")
barplot(NEIMarylandSum,xlab = "Year", ylab = "PM2.5 Emissions (tons)",main = "Total Emissuions of PM2.5 in Baltimore City");
dev.off()
