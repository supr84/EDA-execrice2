library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot3.png")

baltimore_emmisions <- NEI[NEI$fips == '24510', ]
g <- ggplot(baltimore_emmisions, aes(factor(year), Emissions/1000))
g + geom_bar(stat='identity', aes(fill=factor(year)),
             width=0.5) + 
            facet_wrap( ~ type) +
            labs(title='PM 2.5 Emission distribution of Baltimore City by emission type',
                 x='year',
                 y='PM 2.5 Emissions (in kilo tons)')

dev.off()
