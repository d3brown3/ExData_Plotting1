
##Read file into R and store in variable: household_power
household_power <- read.table("C:/Users/dbrow/datasciencecoursera/Exploratory Data Analysis/Electric power consumption/household_power_consumption.txt",
                              sep = ";", header = TRUE)

##convert Date column to correct date format
household_power$Date <-  as.Date(strptime(household_power$Date, format = "%d/%m/%Y"))

library(dplyr)

##convert to numeric
household_power$Global_active_power <- as.numeric(household_power$Global_active_power)
household_power$Sub_metering_1 <- as.numeric(household_power$Sub_metering_1)
household_power$Sub_metering_2 <- as.numeric(household_power$Sub_metering_2)

##filter dataset to relevant dates for plot
filtered_household_power <- filter(household_power, Date == "2007-02-01" | Date == "2007-02-02")

##split plot area into 4 separate plots for multidimensional plot
par(mfrow = c(2,2))

##add TopLeft plot
      with(filtered_household_power, plot(datetime, Global_active_power/500, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
      
##add TopRight plot
      with(filtered_household_power, plot(datetime, Voltage, type = "l", ylab = "Voltage"))
      
##add BottomLeft plot      
      with(filtered_household_power, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black", ylim = c(-2, 35)))
      
##add other lines to plot for comparison
            points(filtered_household_power$datetime, filtered_household_power$Sub_metering_2/5, type = "l", col = "red")
            with(filtered_household_power, points(datetime, Sub_metering_3, type = "l", col = "blue"))
      
##add legend
      legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty=c(1,1), cex = 0.75)
      
      
##add BottomRight plot
      with(filtered_household_power, plot(datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power"))

##copy to png file and save
      dev.copy(png, file = "plot4.png")

dev.off()