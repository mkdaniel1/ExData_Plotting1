hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string ="?")
hpc$Date <- strptime(as.character(hpc$Date), "%d/%m/%Y")
hpc$Date <- as.Date(hpc$Date)
hpc1 <- with (hpc, hpc[(Date == "2007-02-01") | Date == "2007-02-02",])
hpc1$Date <- strptime(paste0(hpc1$Date, sep = " ", hpc1$Time), "%Y-%m-%d %H:%M:%S")


png(file = "plot4.png")
par(mfrow = c(2,2))

plot(hpc1$Date,hpc1$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")

plot(hpc1$Date, hpc1$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(hpc1$Date,hpc1$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(hpc1$Date,hpc1$Sub_metering_2, type="l", col = "Red")
lines(hpc1$Date,hpc1$Sub_metering_3, type="l", col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=2, col = c("Black","Red", "Blue"))

plot(hpc1$Date, hpc1$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()