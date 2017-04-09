source("read_data.R")

plot4 <- function(path)
{
  dat <- readData(path)
  dat$preciseTime <- strptime(paste(dat$Date, dat$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")
  png(filename = "plot4.png", width = 480, height = 480, units = "px")
  par(mfrow = c(2,2))
  plot(dat$preciseTime, dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(dat$preciseTime, dat$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(dat$preciseTime, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  points(dat$preciseTime, dat$Sub_metering_2, col = "red", type = "l")
  points(dat$preciseTime, dat$Sub_metering_3, col = "blue", type = "l")
  legend("topright", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, bty = "n")
  plot(dat$preciseTime, dat$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  dev.off()
}