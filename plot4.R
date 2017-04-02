#PLOT 4
#read data
hpc <- read.table("household_power_consumption.txt", sep=";", nrows=2075260, header=TRUE, quote="", strip.white=TRUE, stringsAsFactors = FALSE, na.strings="?")
#subset data to just the two days
dates <- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007"))
#change class of Date variable to Date
dates$Date <- as.Date(dates$Date, format = "%d/%m/%Y")
#combine the Date and Time to create a new column DateTime
dates$DateTime <- as.POSIXct(paste(dates$Date, dates$Time))
#voltage/ datetime plot
plot(dates$DateTime, dates$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
dev.off()
#global_reactive_power/ datetime plot
plot(dates$DateTime, dates$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
#plot4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,3))
#plot 1
plot(dates$DateTime, dates$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
#plot Voltage
plot(dates$DateTime, dates$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
#plot 2
plot(dates$DateTime, dates$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(dates$DateTime, dates$Sub_metering_2, type="l", col="red")
lines(dates$DateTime, dates$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
#plot Global Reactive Power
plot(dates$DateTime, dates$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
