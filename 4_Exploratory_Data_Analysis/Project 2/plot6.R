if (!file.exists("data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "data.zip")
}
if (!(file.exists("summarySCC_PM25.rds") & file.exists("Source_Classification_Code.rds"))) {
  unzip("data.zip")
}
data <- readRDS("summarySCC_PM25.rds")[c("Emissions", "year", "SCC", "fips")]
baltCityData <- subset(data, fips == "24510")
losAngData <- subset(data, fips = "06037")
SCC_key <- readRDS("Source_Classification_Code.rds")[c("SCC", "Short.Name")]
mvKeys <- SCC_key$SCC[grepl("Vehicle", SCC_key$Short.Name)]
mvBaltCityData <- subset(baltCityData, baltCityData$SCC %in% mvKeys)
mvLosAngData <- subset(losAngData, losAngData$SCC %in% mvKeys)
baltCityTotals <- sapply(split(mvBaltCityData$Emissions, mvBaltCityData$year), sum)
losAngTotals <- sapply(split(mvLosAngData$Emissions, mvLosAngData$year), sum)
png(filename = "plot6.png", width = 480, height = 480)
plot(names(baltCityTotals), baltCityTotals, pch=19, cex=2, xlab="Year", ylab="Total PM2.5 Emissions (tons)", ylim=c(0, max(max(baltCityTotals), max(losAngTotals))), main="LA County & Baltimore City PM2.5 Emissions from Motor Vehicles")
points(names(losAngTotals), losAngTotals, pch=19, cex=2, col='red')
legend('right', pch=19, col=c('red', 'black'), legend=c("LA County", "Baltimore City"), bty='n')
dev.off()