plot1<- function(filedest){
      
      householdPowerConsumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
      householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, "%d/%m/%Y")
      householdPowerConsumptionFeb <- subset(householdPowerConsumption, householdPowerConsumption$Date > "2007-1-31" & householdPowerConsumption$Date < "2007-2-3")
      png(filename = "plot1.png", width = 480, height  = 480)
      hist(as.numeric(householdPowerConsumptionFeb$Global_active_power)/1000, xlab = "Global Active Power (kilowatts)", main = "Global Acive Power", col = "red")
      dev.off()
      
}
