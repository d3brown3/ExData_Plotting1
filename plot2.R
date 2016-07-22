
##Read file into R and store in variable: household_power
household_power <- read.table("C:/Users/dbrow/datasciencecoursera/Exploratory Data Analysis/Electric power consumption/household_power_consumption.txt",
                              sep = ";", header = TRUE)

##convert Date column to correct date format
household_power$Date <-  as.Date(strptime(household_power$Date, format = "%d/%m/%Y"))

library(dplyr)

##convert to numeric
household_power$Global_active_power <- as.numeric(household_power$Global_active_power)

##filter dataset to relevant dates for plot
filtered_household_power <- filter(household_power, Date == "2007-02-01" | Date == "2007-02-02")

##create plot on current device
with(filtered_household_power, plot(datetime, Global_active_power/500, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

##copy to png file and save
dev.copy(png, file = "plot2.png")

dev.off()