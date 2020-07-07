if (!file.exists("data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
}
data <- read.table(unz("data.zip", "household_power_consumption.txt"), sep=";", header=TRUE)
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
png(filename = "plot3.png", width = 480, height = 480)
plot(dmy_hms(paste(data$Date,data$Time)), data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(dmy_hms(paste(data$Date,data$Time)), data$Sub_metering_2, type="l", col="red")
lines(dmy_hms(paste(data$Date,data$Time)), data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()