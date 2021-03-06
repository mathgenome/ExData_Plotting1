#Exploratory Data Analysis
#Project 1, Plot 1
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
#Plot 1
png("plot1.png",width=480,height=480)
par(bg="gray60")
hist(dat$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
#Output generated in:
date()
#Humberto Reyes
#  ^   ^
#  O   O
# (      )
#   A  A