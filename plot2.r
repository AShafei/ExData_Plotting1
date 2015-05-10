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

#plot2
png("plot2.png")
with(powerdata,plot(powerdata$DateTime,powerdata$Global_active_power,
     type="l", xlab=c(""), ylab=c("GlobalActive Power")))

dev.off()