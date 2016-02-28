## This script is mean for the Exploratory Data Analysis Course, Project 1,
## from Johns Hopkins University.

## Date: 2016-02-25 / Author: Rafael Hierro.

## This script downloads data collected from the "Individual household electric 
## power consumption Data Set" (UC Irvine Machine Learning Repository) and 
## constructs the plot required and save it to a PNG file, called "plot1.png",
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

## Launch the png device (480x480 pixels), saving it to file "plot1.png".

png(filename = "./epconsumption/plot1.png", width = 480, height = 480)

## Plots the histogram from "Global Active Power", filling the bars with red 
## color and labeling the plot and the 'x' axis.

hist(plot_data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Close the png device

dev.off()