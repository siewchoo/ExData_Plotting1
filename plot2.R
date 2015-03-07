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

## Open PNG device; create "plot2.png" in my working directory.
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

## Plot and annotate the histogram.
with(data, plot(dateTimeV, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## Close the PNG file device.
dev.off()