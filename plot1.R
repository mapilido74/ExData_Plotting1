##*****************************
##*****************************
##** Project: Part 1: Plot 1 **
##*****************************
##*****************************

## ************************************************
## Histogram "Global Active Power" vs "Frequency" *
## ************************************************


setwd("F:/Exploratory Data Analysis/Project/Part 1")

## Read the data and remove "?"


data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

## Checking characteristics of the data

names(data)
dim(data)  ## 2075259 9
str(data)

## Convert  data$Date in a Date format

data$Date<-as.Date(data$Date, format="%d/%m/%Y")

str(data) ## check the class of the Date

## Subset the data

data_SS<- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

dim(data_SS)

str(data_SS) ## 2880 9

## Removing data from the memory

rm(data)


## Plot 1: Histogram "Global Active Power" vs "Frequency"

hist(data_SS$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving the histogram into png file

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()  ## Close the device


