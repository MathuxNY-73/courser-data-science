source("read_data.R")

plot2 <- function(path)
{
  dat <- readData(path)
  png(filename = "plot2.png", width = 480, height = 480, units = "px")
  dat$preciseTime <- strptime(paste(dat$Date, dat$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")
  plot(dat$preciseTime, dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.off()
}