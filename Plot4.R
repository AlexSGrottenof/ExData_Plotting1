##Set your working directory (setwd) to where household_power_consumption.txt is located
## Read the complete dataset in
PowerCon<-read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)

##Convert Date content into date format
PowerCon[,1]<-as.Date(PowerCon$Date, "%d/%m/%Y")

##Create a subset of the data cotaining only observations
##from 2007-02-01 and 2007-02-01
subPower<-subset(PowerCon, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

##Create Date with Time variable then format into Date/Time
DateTime<-paste(subPower$Date, subPower$Time, sep=" ")
subPower<-cbind(subPower, DateTime)
x<-as.POSIXct(strptime(subPower$DateTime, "%Y-%m-%d %H:%M:%S", tz="EST"))

##Specify and format the y-axis variables
y<-as.numeric(as.character(subPower$Global_active_power))
Sub_metering_1<-as.numeric(subPower$Sub_metering_1)
Sub_metering_2<-as.numeric(subPower$Sub_metering_2)
Sub_metering_3<-as.numeric(subPower$Sub_metering_3)
Voltage<-as.numeric(subPower$Voltage)
Global_reactive_power<-as.numeric(subPower$Global_reactive_power)

##Output the plots into a png file created in your Working Directory
png(filename = "plot4.png")
    par(mfcol=c(2,2))
  plot(x,y, type="l", ylab= "Global Active Power (kilowatts)",xlab="" )
  plot(x,Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
  lines(x,Sub_metering_2, col="Red")
  lines(x,Sub_metering_3, col="Blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,col=c("Black", "Blue", "Red"))
  plot(x,Voltage, xlab="datetime", type="l")
  plot(x,Global_reactive_power, xlab="datetime", type="l")
dev.off()