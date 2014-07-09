NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot1.png")
yearly_pm25_emissions <- tapply(NEI$Emissions, NEI$year, sum)
barplot(yearly_pm25_emissions/100000, col=(1:4), xlab='year', ylab='PM 2.5 emissions (in million tons)')
title(main='PM 2.5 emission distribution in USA')
dev.off()