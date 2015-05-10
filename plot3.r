#install the sqldf library and it's dependices 
install.packages("sqldf")
#loading sqldf library which helps reading a portion of file
library(sqldf)

#set the working Directory
setwd("D:\\Shafei\\ExploratoryDataWD\\Week1 Assignment")
#read the needed data and filter any NA values "?"
powerdata<- read.csv.sql("household_power_consumption.txt", 
                         sql = "select * from file where Date ='1/2/2007' or Date= '2/2/2007'",
                         header = TRUE, sep = ";",filter = "tr -d '?' ")

#convert the datetime object
powerdata$DateTime<- strptime(paste(powerdata$Date, powerdata$Time),"%d/%m/%Y %H:%M:%S")

#plot3
png("plot3.png")
with(powerdata,plot(powerdata$DateTime,powerdata$Sub_metering_1,
                    type="n", xlab=c(""), ylab=c("Energy sub metering")))

with(powerdata,points(powerdata$DateTime,powerdata$Sub_metering_1,col= "black",type="l"))
with(powerdata,points(powerdata$DateTime,powerdata$Sub_metering_2,col= "red",type="l"))
with(powerdata,points(powerdata$DateTime,powerdata$Sub_metering_3,col= "blue",type="l"))
legend("topright",pch="__",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()