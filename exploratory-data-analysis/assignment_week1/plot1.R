source("read_data.R")

plot1 <- function(path)
{
  dat <- readData(path)
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  hist(dat$Global_active_power, col = "red", axes = TRUE, main="Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
}