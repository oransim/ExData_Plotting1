library()
Sys.setlocale()

a <- read.table("C:\\Users\\oran\\Documents\\R\\coursera\\Exploratory Data Analysis\\Week 1\\household_power_consumption.txt",header = T,sep =";" )
#converting factor to character
a[,1] <- as.character(a[,1])

#filtering DF
filtered <- a[a$Date=="1/2/2007" | a$Date=="2/2/2007",]

#checking
head(a,10)
str(a)

#Global_active_power to numeric
filtered$Global_active_power <- as.numeric(as.character(filtered$Global_active_power))
filtered$Sub_metering_1 <- as.numeric(as.character(filtered$Sub_metering_1))
filtered$Sub_metering_2 <- as.numeric(as.character(filtered$Sub_metering_2))
filtered$Sub_metering_3 <- as.numeric(as.character(filtered$Sub_metering_3))

#adding datetime veriable
filtered$datetime <-  as.POSIXct(paste(filtered$Date, filtered$Time), format="%d/%m/%Y %H:%M:%S")

par(mar = c(3,5.1,5,4))
par(mfrow=c(1,1))

#first histogram
hist(filtered$Global_active_power,col = "red",xlab = "Global active power (kilowatts)" ,main = "Global Active power",ylab = "Frequency")

#first line chart
plot(y=filtered$Global_active_power,x =filtered$datetime , type = "l",ylab = "Global active power (kilowatts)")


#Second line chart

par(mfrow=c(1,1))
plot(y=filtered$Sub_metering_1,x =filtered$datetime , type = "l",xlab = "",ylab = "Energy sub metering")
lines(filtered$Sub_metering_2,x = filtered$datetime,col = "red" )
lines(filtered$Sub_metering_3,x = filtered$datetime,col = "blue" )
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lty=1)


#multiple charts
par(mar = c(4,5,5,3))
par(mfrow=c(2,2))
plot(y=filtered$Global_active_power,x =filtered$datetime , type = "l",xlab = "Global active power (kilowatts)")
plot(y=filtered$Voltage,x =filtered$datetime , type = "l",xlab = "datetime",ylab = "Voltage")
plot(y=filtered$Sub_metering_1,x =filtered$datetime , type = "l",xlab = "",ylab = "Energy sub metering")
lines(filtered$Sub_metering_2,x = filtered$datetime,col = "red" )
lines(filtered$Sub_metering_3,x = filtered$datetime,col = "blue" )
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lty=1,cex = 0.7, bty = "n")
plot(y=filtered$Global_reactive_power,x =filtered$datetime , type = "l",xlab = "datetime",ylab = "Global reactive power")
