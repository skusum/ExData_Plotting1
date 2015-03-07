## The required data is "Electric Power Consumption". It can be downloaded from 
## 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
## It is a zip file. It should be unzipped and saved in the working directory.
## Please save it as "household_power_consumption.txt".

library(datasets)
library(lubridate)

## to find the number of rows to skip so as to get data of interest
## time difference between the start time of the original data and 
## start time of our interest

time_diff <- difftime(strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"),
                    strptime("2006-12-16 17:24:00", format="%Y-%m-%d %H:%M:%S"),
                    unit="mins")
skip_rows <- time_diff+1  ## skip one extra row for row of colnames

## reads only subset of data for 2007/02/01 and 2007/02/01,
## two days= 2*24*60=2880 rows

data_of_int <- read.table("household_power_consumption.txt", sep=";", 
                          skip=skip_rows, nrows=2880)

## assigns colnames of the original data to the subset data

col_names <- colnames(read.table("household_power_consumption.txt", sep=";",
                                 nrows=1, header=TRUE))
colnames(data_of_int) <- col_names

## draws histogram of "Global_active_power"
hist(data_of_int$Global_active_power, col="red", 
     xlab="Global Active Power(kilowatt)",
     mar=c(5, 4, 4, 2),
     main="Global Active Power", cex.lab=.75, cex.axis=.5)

     