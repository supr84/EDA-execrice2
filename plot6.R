library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot6.png")

bc_emmisions <- NEI[NEI$fips == '24510' | NEI$fips == '06037', ]
vehicle_sources <- SCC$SCC[grepl('Vehicle', SCC$EI.Sector, ignore.case=TRUE)]
vehicle_emissions_data <- bc_emmisions[bc_emmisions$SCC %in% vehicle_sources,]
g <- ggplot(vehicle_emissions_data, aes(factor(year), Emissions/1000))
g + geom_bar(stat='identity', aes(fill=factor(year)),
             width=0.5) + 
    facet_wrap( ~ fips) +
    labs(title='PM 2.5 Emission by vehicle sources for \nBaltimore (24510) and California (06037) ',
         x='year',
         y='PM 2.5 Emissions (in kilo tons)')

dev.off()