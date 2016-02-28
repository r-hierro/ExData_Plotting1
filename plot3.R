## This script is mean for the Exploratory Data Analysis Course, Project 1,
## from Johns Hopkins University.

## Date: 2016-02-27 / Author: Rafael Hierro.

## This script downloads data collected from the "Individual household electric 
## power consumption Data Set" (UC Irvine Machine Learning Repository) and 
## constructs the plot required and save it to a PNG file, called "plot3.png",
##  with a width of 480 pixels and a height of 480 pixels.

## Create a directory, download the dataset and unzip it.

if(!file.exists("./epconsumption")){dir.create("./epconsumption")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl,destfile=".//epconsumption//epcdataset.zip")

unzip(".//epconsumption//epcdataset.zip", exdir = ".//epconsumption")

## Reads the "Individual household electric power consumption Data Set" and
## subsets in Variable "plot_data" data from dates 2007-02-01 and 2007-02-02.

data <-read.table("./epconsumption/household_power_consumption.txt", 
                  header = TRUE, sep = ";", na.strings = "?")

plot_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

## Creates a new column in the data set, called 'Long Date', pasting the columns
## 'Date' and 'Time, with date format.

plot_data$Long_Date <- strptime(paste(plot_data$Date, plot_data$Time), 
                                "%d/%m/%Y %H:%M:%S")

## Sets the 'Time' to English language (due to different system language), so
## the plots show the weekdays in English.

Sys.setlocale(category = "LC_TIME", "English")

## Launch the png device (480x480 pixels), saving it to file "plot3.png".

png(filename = "./epconsumption/plot3.png", width = 480, height = 480)

## Plots the graph for the 'Energy sub-metering' during those dates in line 
## format, with different colors for each one, labeling the 'y' axis and 
## deleting any label for the 'x' axis.

plot(plot_data$Long_Date, plot_data$Sub_metering_1, 
     type="l", 
     xlab="", 
     ylab="Energy sub metering")

lines(plot_data$Long_Date, plot_data$Sub_metering_2, 
      col = "red")

lines(plot_data$Long_Date, plot_data$Sub_metering_3, 
      col = "blue")

## Writes the lenged for the graph for each variable in the top right corner.

legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty = 1)

## Close the png device

dev.off()