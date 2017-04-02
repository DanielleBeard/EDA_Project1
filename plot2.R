#PLOT 2 
#read data
hpc <- read.table("household_power_consumption.txt", sep=";", nrows=2075260, header=TRUE, quote="", strip.white=TRUE, stringsAsFactors = FALSE, na.strings="?")
#subset data to just the two days
dates <- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007"))
#change class of Date variable to Date
dates$Date <- as.Date(dates$Date, format = "%d/%m/%Y")
#combine the Date and Time to create a new column DateTime
dates$DateTime <- as.POSIXct(paste(dates$Date, dates$Time))
#plot 2
png("plot2.png", width = 480, height = 480)
plot(dates$DateTime, dates$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()





