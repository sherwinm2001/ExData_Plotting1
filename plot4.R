data<-read.table("household_power_consumption.txt", sep=";", header = TRUE, 
                  colClasses = c("character", "character", "numeric", "numeric",
                                 "numeric", "numeric", "numeric", "numeric", "numeric"))
data<-data[(data$Date %in% c("1/2/2007","2/2/2007")),]
par("mfrow"=c(2,2))
par("mar"=c(5,5,5,5))
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
with(data,plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(data,plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))
plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col="red")
lines(datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", 
                                            "Sub_metering_3"), col=c("black", "red", "blue"))
with(data,plot(datetime, Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power"))
dev.copy(png,"plot4.png",480,480)
dev.off()
     