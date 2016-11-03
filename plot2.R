plot2 <- function(filedest){
      
      householdPowerConsumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
      householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, "%d/%m/%Y")
      householdPowerConsumptionFeb <- subset(householdPowerConsumption, householdPowerConsumption$Date > "2007-1-31" & householdPowerConsumption$Date < "2007-2-3")
      png(filename = "plot2.png", width = 480, height  = 480)
      householdPowerConsumptionFeb$Time <-  strptime(paste(householdPowerConsumptionFeb$Date, householdPowerConsumptionFeb$Time), "%Y-%m-%d %H:%M:%S", tz = "GMT")
      with(householdPowerConsumptionFeb, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
      dev.off()
      
}