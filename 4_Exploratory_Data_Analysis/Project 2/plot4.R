if (!file.exists("data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "data.zip")
}
if (!(file.exists("summarySCC_PM25.rds") & file.exists("Source_Classification_Code.rds"))) {
  unzip("data.zip")
}
data <- readRDS("summarySCC_PM25.rds")[c("Emissions", "year", "SCC")]
SCC_key <- readRDS("Source_Classification_Code.rds")[c("SCC", "Short.Name")]
coalKeys <- SCC_key$SCC[grepl("Coal", SCC_key$Short.Name)]
coalData <- subset(data, data$SCC %in% coalKeys)
totals <- sapply(split(coalData$Emissions, coalData$year), sum)
png(filename = "plot4.png", width = 480, height = 480)
plot(names(totals), totals, pch=19, cex=2, xlab="Year", ylab="Total PM2.5 Emissions (tons)", ylim=c(0, max(totals)), main="United States PM2.5 Emissions from Coal")
dev.off()