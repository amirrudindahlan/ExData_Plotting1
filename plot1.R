
# Name: Amirrudin Bin Dahlan
# Date: 8/10/2014
# Assumptions before executing this script:  
# (1) File must be downloaded and unzip to the working directory
# (2) The file name is 'household_power_consumption.txt'
# (3) Install package "sqldf"

# read from file
data <- read.csv("household_power_consumption.txt", sep=";", quote="", na.strings="?", stringsAsFactors=TRUE)

# load sqldf
library(sqldf)

# read only 1/2/2007 and 2/2/2007
data = sqldf("select * from data where Date in ('1/2/2007','2/2/2007')")

# plot histogram
hist(data$Global_active_power,
     col=c("red"),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     cex.axis = 0.7,
     cex.lab=0.7
     )

# prep the png function
dev.print(device=png, 
          width=480,
          height=480, 
          "plot1.png")

# create file and close stream
dev.off()

