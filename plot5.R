library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot5.png")

baltimore_emmisions <- NEI[NEI$fips == '24510', ]
vehicle_sources <- SCC$SCC[grep('Vehicle', SCC$EI.Sector)]
vehicle_emissions_data <- baltimore_emmisions[baltimore_emmisions$SCC %in% vehicle_sources,]
g <- ggplot(vehicle_emissions_data, aes(factor(year), Emissions/1000))
g + geom_bar(stat='identity', aes(fill=factor(year)),
             width=0.5) +
            labs(title='PM 2.5 Emission due to vehicles in Baltimore City',
                 x='year',
                 y='PM 2.5 Emissions (in kilo tons)')

dev.off()
