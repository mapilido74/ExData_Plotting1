##*****************************
##*****************************
##** Project: Part 1: Plot 3 **
##*****************************
##*****************************

## **************************************
##  "Energy sub metering"  vs "Datetime *
## **************************************


setwd("F:/Exploratory Data Analysis/Project/Part 1")

## Reading the data and remove "?"

data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

## Checking characteristics for the data

names(data)
dim(data)  ## 2075259 9
str(data)

## Convert  data$Date in a Date format

data$Date<-as.Date(data$Date, format="%d/%m/%Y")

str(data) ## check the class of the Date

## Subset the data

data_SS<- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

dim(data_SS) ## 2880 9

## Removing data from the memory

rm(data)

## Converting dates: Put together Date and Time

datetime <- paste(as.Date(data_SS$Date), data_SS$Time)

## Add datetime to the subset of the data "data_SS"

data_SS$Datetime <- as.POSIXct(datetime)

dim(data_SS) ## Now  2880    10

str(data_SS)

## Plot 3: "Energy Sub Metering" vs "Date and Time"

with(data_SS, {
    plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Energy sub metering")
    lines(Sub_metering_2~Datetime,col="Red")
    lines(Sub_metering_3~Datetime,col="Blue")
})

legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
       , col=c("black", "red", "blue"), lty=1, lwd=0.5, cex=0.75)

## Save the plot into png file

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()  ## Close the device




