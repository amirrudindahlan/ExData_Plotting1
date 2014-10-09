
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

# set plot positions
par(mfrow=c(2,2))

# plot chart 1 ------------------------------------------------------
with(data, 
     plot(date_time, 
          Global_active_power, 
          type="l",
          ylab="Global Active Power",
          xlab="",
          cex.axis = 0.7,
          cex.lab=0.7
     )
)

# plot chart 2 ------------------------------------------------------
with(data, 
     plot(date_time, 
          Voltage, 
          type="l",
          ylab="Voltage",
          xlab="datetime",
          cex.axis = 0.7,
          cex.lab=0.7
     )
)

# plot chart 3 ------------------------------------------------------
# set plot to line type
par(pch=22)

# plot sub meter 1
with(data, 
     plot(date_time, 
          Sub_metering_1, 
          type="l",
          ylab="Energy sub metering",
          xlab="",
          col = "black",
          cex.axis = 0.7,
          cex.lab=0.7
     )
)

# plot sub meter 2
with(data, 
     lines(date_time, 
           Sub_metering_2, 
           type="l",
           col = "red",
           cex.axis = 0.7,
           cex.lab=0.7
     )
)

# plot sub meter 3
with(data, 
     lines(date_time, 
           Sub_metering_3, 
           type="l",
           col = "blue",
           cex.axis = 0.7,
           cex.lab=0.7
     )
)

# legend
legend("topright", 
       lty=1, 
       cex=0.5
       bty = "n",
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"
       )
)

# plot chart 4 ------------------------------------------------------
with(data, 
     plot(date_time, 
          Global_reactive_power, 
          type="l",
          ylab="Global_reactive_power",
          xlab="datetime",
          cex.axis = 0.7,
          cex.lab=0.7
     )
)



# prep the png function
dev.print(device=png, 
          width=480,
          height=480, 
          "plot4.png")

# create file and close stream
dev.off()

