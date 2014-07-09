NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot2.png")

baltimore_emmisions <- NEI[NEI$fips == 24510, ]
yearly_pm25_emissions <- tapply(baltimore_emmisions$Emissions,
                                baltimore_emmisions$year,
                                sum)
barplot(yearly_pm25_emissions/1000, col=(1:4),
        xlab='year',
        ylab='PM 2.5 emissions (in million tons)')
title(main='PM 2.5 emission distribution in Baltimore City')
dev.off()