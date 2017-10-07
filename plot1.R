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

png(filename = "C:\\Users\\oran\\Documents\\R\\coursera\\Exploratory Data Analysis\\Week 1\\plot1.png")
#first histogram
hist(filtered$Global_active_power,col = "red",xlab = "Global active power (kilowatts)" ,main = "Global Active power",ylab = "Frequency")

dev.off()
