##*****************************
##*****************************
##** Project: Part 1: Plot 2 **
##*****************************
##*****************************

## *******************************************
##  "Global Active Power" vs "Date and Time" *
## *******************************************


setwd("F:/Exploratory Data Analysis/Project/Part 1")

## Read the data and remove "?"


data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

## Check characteristics for the data

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

## Plot 1: "Global Active Power" vs "Date and Time"

?plot

plot(data_SS$Global_active_power~data_SS$Datetime, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")



## Save the histogram into png file

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()  ## Close the device
