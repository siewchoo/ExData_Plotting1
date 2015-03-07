## This script file assumes that you have downloaded 
##		exdata-data-household_power_consumption.zip
## and unzipped its contents into the same directory as this script.
## 
##
## For this project, we are only interested in examining data for a 
## 2-day period in February, 2007 (ie. 2007-02-01 and 2007-02-02).
dateRange <- seq(as.Date("2007-02-01"), by=1, len=2)

## Read in the data file, selecting only those that are within our dates of interest.
data <- subset(read.csv("household_power_consumption.txt", sep=";", dec = ".", header = TRUE, stringsAsFactors=FALSE, na.strings="?"), 
	       as.Date(Date, "%d/%m/%Y") %in% dateRange)

## Create a new datetime variable; required for drawing the plots later.
dateTimeV <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Column-bind datetime to the rest of the columns.
data <- cbind(dateTimeV, data)

## Open PNG device; create "plot3.png" in my working directory.
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

## Plot and annotate the line plot.
with(data, {
	plot(dateTimeV, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
	lines(dateTimeV, Sub_metering_1, col = "black")
	lines(dateTimeV, Sub_metering_2, col = "red")
	lines(dateTimeV, Sub_metering_3, col = "blue")
})
legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close the PNG file device.
dev.off()