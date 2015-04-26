setwd("E:/Dropbox/@Coursera/Exploritory Data Analysis/EDA Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# use a smaller subset of the data for testputposes
NEISample <- subset(NEI, NEI$fips == "24510" | NEI$fips == "06037" & NEI$type == "ON-ROAD")

NEIsummary <- aggregate(NEISample$Emissions,
                        list(NEISample$fips,NEISample$year),sum)

names(NEIsummary) <- c("City","Year","Emissions")
NEIsummary$City <- sub("06037","LA County",NEIsummary$City)
NEIsummary$City <- sub("24510","Baltimore City",NEIsummary$City)


png(width = 480, height = 480, file = "plot6.png")

ggplot(NEIsummary, aes(x=Year, y=Emissions, colour=City)) +
  geom_point() +
  geom_smooth() +
  ggtitle("PM 2.5 Vehicle Emissions in Baltimore vs. LA") +
  ylab("PM2.5 Emissions (tons)")

dev.off()