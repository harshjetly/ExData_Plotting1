plot3 <- function(filedest){
      
      householdPowerConsumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
      householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, "%d/%m/%Y")
      householdPowerConsumptionFeb <- subset(householdPowerConsumption, householdPowerConsumption$Date > "2007-1-31" & householdPowerConsumption$Date < "2007-2-3")
      png(filename = "plot3.png", width = 480, height  = 480)
      householdPowerConsumptionFeb$Time <-  strptime(paste(householdPowerConsumptionFeb$Date, householdPowerConsumptionFeb$Time), "%Y-%m-%d %H:%M:%S", tz = "GMT")
      plot(householdPowerConsumptionFeb$Time, householdPowerConsumptionFeb$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
      
      lines(householdPowerConsumptionFeb$Time, householdPowerConsumptionFeb$Sub_metering_3, col = "blue")
      lines(householdPowerConsumptionFeb$Time, householdPowerConsumptionFeb$Sub_metering_2, col = "red")
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3" ), col = c("black", "red", "blue"), lty=1:2, cex=0.8)
      
      dev.off()
      
}