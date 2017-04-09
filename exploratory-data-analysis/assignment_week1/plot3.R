source("read_data.R")

plot3 <- function(path)
{
  dat <- readData(path)
  dat$preciseTime <- strptime(paste(dat$Date, dat$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")
  png(filename = "plot3.png", width = 480, height = 480, units = "px")
  plot(dat$preciseTime, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  points(dat$preciseTime, dat$Sub_metering_2, col = "red", type = "l")
  points(dat$preciseTime, dat$Sub_metering_3, col = "blue", type = "l")
  legend("topright", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
  dev.off()
}