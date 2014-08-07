#Exploratory Data Analysis
#Project 1, Plot 4
#Calling the data
#Due to the size of the data set, rows will be selected for dates
#2007-02-01 and 2007-02-02
#This speeds up the process greatly
#Loading package for sql
library(sqldf)
#Selecting for dates 01/02/2007 and 02/02/2007
dat <- read.csv.sql("household_power_consumption.txt",head=TRUE,sep=";", sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
nrow(dat)
#Check for missing data labeled as "?"
length(which(dat=="?"))
#Check for missing data labeled as NA
length(which(is.na(dat)))
#Change date format
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
#Generating a column with Date-Time information
x<-paste(dat$Date,dat$Time)
x<-strptime(x,"%Y-%m-%d %H:%M:%S")
dat$DateTime<-x
rm(x)
#Plot 4
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2),bg="gray60")
plot(dat$DateTime,dat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(dat$DateTime,dat$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(dat$DateTime,dat$Sub_metering_1,type="l",ylab="Global Active Power (kilowatts)",xlab="")
lines(dat$DateTime,dat$Sub_metering_2,col="red")
lines(dat$DateTime,dat$Sub_metering_3,col="blue")
legend("topright", col = c("black","red", "blue"), lty=c(1,1,1),legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),bty="n") #bty = "n" suppress border
plot(dat$DateTime,dat$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()


