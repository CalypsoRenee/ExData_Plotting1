##Coursera - Exploratory Data Analysis - Assignment 1 - Plot 2

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

##Create Plot 2 - DateTime vs Global Active Power (kilowatts)

#Create png file for Plot 2
png(filename = "plot2.png", 
    width = 480, height = 480)

#Create Plot 2

plot(strptime(subsetConsumption$DateTime, "%d/%m/%Y %H:%M:%S"), subsetConsumption$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

#Complete png file
dev.off()

