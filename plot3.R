##Coursera - Exploratory Data Analysis - Assignment 1 - Plot 3

#Download libraries
library(dplyr)
library(data.table)

#Download data set
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="household_power_consumption.zip",method="curl")

#Unzip file
unzip(zipfile="household_power_consumption.zip",exdir="./data")

#Read in text file from unzipped folder
fileName <- "./data/household_power_consumption.txt"
consumptionData <- fread("./data/household_power_consumption.txt", na.strings="?",
                         colClasses = c("character", "character", rep("numeric",7)))
#Create subset of this data
subsetConsumption <- filter(consumptionData, grep("^[1,2]/2/2007", Date))

#Look at header of subset
head(subsetConsumption)
#Look at dimensions of subset
dim(subsetConsumption)
#Look at columns & data types
str(subsetConsumption)

#Create DateTime variable that combines the Date and Time fields
subsetConsumption$DateTime <- paste(subsetConsumption$Date, subsetConsumption$Time)
head(subsetConsumption$DateTime)

##Create Plot 3 - Energy Sub-Metering Plot

#Create png file for Plot 3
png(filename = "plot3.png", 
    width = 480, height = 480)

#Create Plot 3
#Create base plot of DateTime vs Energy sub metering 1 variable
plot(strptime(subsetConsumption$DateTime, "%d/%m/%Y %H:%M:%S"), subsetConsumption$Sub_metering_1, 
     type = "l", xlab = "", ylab = "Energy sub metering")

#Create red line in same plot for DateTime vs Energy sub metering 2 variable
lines(strptime(subsetConsumption$DateTime, "%d/%m/%Y %H:%M:%S"), 
      subsetConsumption$Sub_metering_2, type = "l", col = "red" )

#Create blue line in same plot for DateTime vs Energy sub metering 3 variable
lines(strptime(subsetConsumption$DateTime, "%d/%m/%Y %H:%M:%S"), 
      subsetConsumption$Sub_metering_3, type = "l", col = "blue" )

#Create graph legend
legend("topright", lty= 1, col = c("Black", "red", "blue"), 
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Complete png file
dev.off()

