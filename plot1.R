#PLOT 1
#read data
hpc <- read.table("household_power_consumption.txt", sep=";", nrows=2075260, header=TRUE, quote="", strip.white=TRUE, stringsAsFactors = FALSE, na.strings="?")
#subset data to just the two days
dates <- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007"))
#change class of Date variable to Date
dates$Date <- as.Date(dates$Date, format = "%d/%m/%Y")
#Plot 1
png("plot1.png", width = 480, height = 480)
hist(dates$Global_active_power, type = "l", main = "Global Active Power", col = 'red', ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()
