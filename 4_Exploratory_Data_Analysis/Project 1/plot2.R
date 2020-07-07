if (!file.exists("data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
}
data <- read.table(unz("data.zip", "household_power_consumption.txt"), sep=";", header=TRUE)
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
png(filename = "plot2.png", width = 480, height = 480)
plot(dmy_hms(paste(data$Date,data$Time)), data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()