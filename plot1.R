#This script makes a plot for the first part of assignment for exploratory data analysis ob coursera
data <- read.csv2 ("household_power_consumption.txt", , stringsAsFactor=F)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
#subsetting to the data needed
library(plyr)
curr <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
#getting the historgram
png("plot1.png")
hist(curr$Global_active_power, main = "Global Active Power",  xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
