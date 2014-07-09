library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot4.png")

coal_sectors <- SCC$SCC[grepl('coal', SCC$SCC.Level.Three, ignore.case=TRUE) | grepl("Lignite", SCC$SCC.Level.Three, ignore.case=TRUE) ]
coal_emissions_data <- NEI[NEI$SCC %in% coal_sectors,]
g <- ggplot(coal_emissions_data, aes(factor(year), Emissions/1000))
g + geom_bar(stat='identity', aes(fill=factor(year)),
             width=0.5) +
            labs(title='PM 2.5 Emission due to coal combustions in United States',
                 x='year',
                 y='PM 2.5 Emissions (in kilo tons)')

dev.off()
