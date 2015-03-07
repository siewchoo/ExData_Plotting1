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

## Open a PNG device and create "plot1.png" in my working directory.
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

## Plot the histogram.
hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

## Close the PNG file device.
dev.off()