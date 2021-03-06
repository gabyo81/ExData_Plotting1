powerfile <- read.table(file = "household_power_consumption.txt",sep = ";",colClasses = "character",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip = 66637,nrows = 2880,na.strings = "?")
powerfile$Global_active_power <- as.numeric(powerfile$Global_active_power)
powerfile$Global_reactive_power <- as.numeric(powerfile$Global_reactive_power)
powerfile$Voltage <- as.numeric(powerfile$Voltage)
powerfile$Global_intensity <- as.numeric(powerfile$Global_intensity)
powerfile$Sub_metering_1 <- as.numeric(powerfile$Sub_metering_1)
powerfile$Sub_metering_3 <- as.numeric(powerfile$Sub_metering_3)
powerfile$Sub_metering_2 <- as.numeric(powerfile$Sub_metering_2)
powerfile$Datetime <- strptime( paste(powerfile$Date,powerfile$Time),"%d/%m/%Y %H:%M:%S",tz = "UCT")


png("plot4.png",width = 480,height = 480)
par(mfcol=c(2,2))
par(bg=NA) 
plot(x = powerfile$Datetime,y = powerfile$Global_active_power,type = "l",ylab = "Gloabl Active Power (kilowatts)",xlab="")

plot(x=powerfile$Datetime,y=powerfile$Sub_metering_1,ylab = "Energy Sub metering",col="black",type = "l",xlab="")
lines(x=powerfile$Datetime,y=powerfile$Sub_metering_2,col="red",type = "l")
lines(x=powerfile$Datetime,y=powerfile$Sub_metering_3,col="blue",type = "l")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1,1,1),bty = "n")

plot(x = powerfile$Datetime,y = powerfile$Voltage,type = "l",ylab = "Voltage",xlab="datetime")

plot(x = powerfile$Datetime,y = powerfile$Global_reactive_power,type = "l",ylab = "Global Reactive Power",xlab="datetime")



dev.off()