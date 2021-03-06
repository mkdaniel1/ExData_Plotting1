hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string ="?")
hpc$Date <- strptime(as.character(hpc$Date), "%d/%m/%Y")
hpc$Date <- as.Date(hpc$Date)
hpc1 <- with (hpc, hpc[(Date == "2007-02-01") | Date == "2007-02-02",])
png(file = "plot1.png")
par(mfrow =c(1,1))
hist(hpc1$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
