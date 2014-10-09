
# Name: Amirrudin Bin Dahlan
# Date: 8/10/2014
# Assumptions before executing this script:  
# (1) File must be downloaded and unzip to the working directory
# (2) The file name is 'household_power_consumption.txt'
# (3) Install packages "sqldf" and "lubridate"

# read from file
data <- read.csv("household_power_consumption.txt", sep=";", quote="", na.strings="?", stringsAsFactors=TRUE)

# load packages
library(sqldf)
library(lubridate)

# read only 1/2/2007 and 2/2/2007
data = sqldf("select * from data where Date in ('1/2/2007','2/2/2007')")

# create new column to store date and time
data$date_time = paste(data$Date,data$Time,sep=' ')

# convert to date time format
data$date_time=dmy_hms(data$date_time)

# set plot to line type
par(pch=22)

# plot chart
with(data, 
     plot(date_time, 
          Global_active_power, 
          type="l",
          ylab="Global Active Power (kilowatts)",
          xlab="",
          cex.axis = 0.7,
          cex.lab=0.7
          )
     )

# prep the png function
dev.print(device=png, 
          width=480,
          height=480, 
          "plot2.png")

# create file and close stream
dev.off()


