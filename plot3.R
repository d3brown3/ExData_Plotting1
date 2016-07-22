
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

##create plot on current device
with(filtered_household_power, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black", ylim = c(-2, 35)))

##add other lines to plot for comparison
points(filtered_household_power$datetime, filtered_household_power$Sub_metering_2/5, type = "l", col = "red")
with(filtered_household_power, points(datetime, Sub_metering_3, type = "l", col = "blue"))

##add legend
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))

##copy to png file and save
dev.copy(png, file = "plot3.png")

dev.off()