#This script makes a plot for the fourth part of assignment for exploratory data analysis ob coursera

#Sorry that the weekday abbreviatures appear in Russian. That is a system feature, could not change it in R

data <- read.csv2 ("household_power_consumption.txt", , stringsAsFactor=F)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
#subsetting to the data needed
library(plyr)
curr <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
curr <- mutate(curr, ExactTime = strptime(paste(as.character(curr$Date), curr$Time), format="%Y-%m-%d %H:%M:%S"))
curr$Sub_metering_1 <- as.numeric(curr$Sub_metering_1)
curr$Sub_metering_2 <- as.numeric(curr$Sub_metering_2)
curr$Sub_metering_3 <- as.numeric(curr$Sub_metering_3)
curr$Voltage <- as.numeric(curr$Voltage)
curr$Global_reactive_power <- as.numeric(curr$Global_reactive_power)

png("plot4.png")
par(mfrow = c(2,2))
plot(curr$ExactTime, curr$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
plot(curr$ExactTime, curr$Voltage, type = "l", xlab ="", ylab = "Voltage")
plot(curr$ExactTime, curr$Sub_metering_1, type = "l", xlab ="", ylab = "Energy Sub metering")
lines (curr$ExactTime, curr$Sub_metering_2, col = "red")
lines (curr$ExactTime, curr$Sub_metering_3, col = "blue")
legend("topright", legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1,1,1)
)
plot(curr$ExactTime, curr$Global_reactive_power, type = "l", xlab ="", ylab = "Global reactive Power")

dev.off()
