library(ggplot2)
library(dplyr)
if (!file.exists("data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "data.zip")
}
if (!(file.exists("summarySCC_PM25.rds") & file.exists("Source_Classification_Code.rds"))) {
  unzip("data.zip")
}
data <- readRDS("summarySCC_PM25.rds")[c("Emissions", "year", "fips", "type")]
baltCityData <- subset(data, fips == "24510")
totals <- aggregate(Emissions ~ year * type, baltCityData, sum)
png(filename = "plot3.png", width = 480, height = 480)
qplot(factor(year), Emissions, data = totals, facets = .~type, xlab = "Year", ylab = "Total PM2.5 Emissions (tons)", main = "Baltimore City PM2.5 Emissions, by Type") + theme_bw()
dev.off()