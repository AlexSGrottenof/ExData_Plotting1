##Set your working directory (setwd) to where household_power_consumption.txt is located
## Read the complete dataset in
  PowerCon<-read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)

##Convert Date content into date format
  PowerCon[,1]<-as.Date(PowerCon$Date, "%d/%m/%Y")

##Create a subset of the data cotaining only observations
##from 2007-02-01 and 2007-02-01
  subPower<-subset(PowerCon, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

## Convert variable of interest to Numeric
  GAP<-as.numeric(subPower$Global_active_power)

##Create plot1: Histogram in png file created in your Working Directory
png(filename= "plot1.png")
  par(mfrow=c(1,1))
  hist(GAP,xlab="Global Active Power (kilowatts)", main= "Global Active Power",col= "red",breaks=12)
dev.off()

