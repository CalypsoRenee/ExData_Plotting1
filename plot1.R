##Coursera - Exploratory Data Analysis - Assignment 1

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
consumptionData <- fread("./data/household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE, 
                         colClasses = c("character", "character", rep("numeric",7)))
#Create subset of this data
subsetConsumption <- filter(consumptionData, grep("^[1,2]/2/2007", Date))

#Look at dimensions of subset
dim(subsetConsumption)
#Look at columns & data types
str(subsetConsumption)

#Create DateTime variable that combines the Date and Time fields
subsetConsumption$DateTime <- paste(subsetConsumption$Date, subsetConsumption$Time)

##Create Plot 1 - Global Active Power (kilowatts) vs Frequency

#Create png file for Plot 1
png(filename = "plot1.png", 
    width = 480, height = 480)

#Create histogram - Plot 1
hist(subsetConsumption$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12)

#Complete png file
dev.off()






