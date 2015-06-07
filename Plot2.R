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

##Specify and format the y-axis variable
y<-as.numeric(as.character(subPower$Global_active_power))

##Output the plot into a png file created in your Working Directory
png(filename= "plot2.png")
    par(mfrow=c(1,1))
  plot(x,y, type="l", ylab= "Global Active Power (kilowatts)",xlab="" )
dev.off()