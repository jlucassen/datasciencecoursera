if (!file.exists("data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "data.zip")
}
if (!(file.exists("summarySCC_PM25.rds") & file.exists("Source_Classification_Code.rds"))) {
  unzip("data.zip")
}
data <- readRDS("summarySCC_PM25.rds")[c("Emissions", "year", "fips")]
baltCityData <- subset(data, fips == "24510")
totals <- sapply(split(baltCityData$Emissions, baltCityData$year), sum)
png(filename = "plot2.png", width = 480, height = 480)
plot(names(totals), totals, pch=19, cex=2, xlab="Year", ylab="Total PM2.5 Emissions (tons)", ylim=c(0, max(totals)), main="Baltimore City PM2.5 Emissions")
dev.off()