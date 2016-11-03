plot4 <- function(filedest){

      #Cleaning Data      
      householdPowerConsumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
      householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, "%d/%m/%Y")
      householdPowerConsumptionFeb <- subset(householdPowerConsumption, householdPowerConsumption$Date > "2007-1-31" & householdPowerConsumption$Date < "2007-2-3")
      householdPowerConsumptionFeb$Time <-  strptime(paste(householdPowerConsumptionFeb$Date, householdPowerConsumptionFeb$Time), "%Y-%m-%d %H:%M:%S", tz = "GMT")
      
      #Setting up plot
      png(filename = "plot4.png", width = 480, height  = 480)
      par(mfrow = c(2,2))
     
      
      #Creating first plot [1,]
      with(householdPowerConsumptionFeb, plot(Time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))
      
      #Creating second plot [,1]
      with(householdPowerConsumptionFeb, plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage" ))
      
      #Creating third plot [2,]
      plot(householdPowerConsumptionFeb$Time, householdPowerConsumptionFeb$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
      lines(householdPowerConsumptionFeb$Time, householdPowerConsumptionFeb$Sub_metering_3, col = "blue")
      lines(householdPowerConsumptionFeb$Time, householdPowerConsumptionFeb$Sub_metering_2, col = "red")
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3" ), col = c("black", "red", "blue"), lty=1:2, cex=0.8)
      
      #Creating fourth plot [,2]
      with(householdPowerConsumptionFeb, plot(Time, Global_reactive_power, type = "l", xlab = "datetime" ))
      
      
      dev.off()
      
}