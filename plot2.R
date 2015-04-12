#This script makes a plot for the second part of assignment for exploratory data analysis ob coursera

#Sorry that the weekday abbreviatures appear in Russian. That is a system feature, could not change it in R

data <- read.csv2 ("household_power_consumption.txt", , stringsAsFactor=F)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
#subsetting to the data needed
library(plyr)
curr <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
curr <- mutate(curr, ExactTime = strptime(paste(as.character(curr$Date), curr$Time), format="%Y-%m-%d %H:%M:%S"))

png("plot2.png")
plot(curr$ExactTime, curr$Global_active_power, type = "l",  main = "Global Active Power", xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()
