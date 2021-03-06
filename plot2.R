hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string ="?")
hpc$Date <- strptime(as.character(hpc$Date), "%d/%m/%Y")
hpc$Date <- as.Date(hpc$Date)
hpc1 <- with (hpc, hpc[(Date == "2007-02-01") | Date == "2007-02-02",])
hpc1$Date <- strptime(paste0(hpc1$Date, sep = " ", hpc1$Time), "%Y-%m-%d %H:%M:%S")
png(file = "plot2.png")
par(mfrow =c(1,1))
plot(hpc1$Date,hpc1$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.off()